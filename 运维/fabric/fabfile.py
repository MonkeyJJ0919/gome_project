#!/usr/bin/python
from fabric.api import *
from fabric.context_managers import *
from fabric.contrib.console import confirm
from fabric.contrib.files import *
import time,os
i_1='machtalk@10.112.80.7:22'
i_2='machtalk@10.112.80.8:22'
env.hosts=[i_1,i_2]
env.roledefs = {
    'all':[i_1,i_2]
}
env.passwords = {
 i_1:'GVk2qWUTW7kP2hwQ',
 i_2:'GVk2qWUTW7kP2hwQ'
}
env.profile='500'
env.project_basepath='/opt/svncode/gitpro/'
env.project_parent_dir = env.project_basepath+'ps-penguin/'
env.postfix='-0.0.1-SNAPSHOT.jar'
env.deploy_basepath='/opt/machtalk/pro/'
env.exec_dir_name = 'exec'
tmp_path = "/data/tmp/"

def project_update(dir_path):
    with lcd(dir_path):
        local("/usr/bin/git fetch origin")
        local("/usr/bin/git checkout 500")
        local("/usr/bin/git pull origin 500")

def project_package(dir_path, project_name):
    with lcd(dir_path):
        local("/usr/local/maven3/bin/mvn clean package -Dmaven.test.skip=true -P "+env.profile)

def project_init_dir(deploy_path, tmp_path, project_name):
    if not exists(tmp_path+project_name):
        run("sudo mkdir -p "+tmp_path+project_name)
        run("sudo chown machtalk:machtalk "+tmp_path+project_name)
    if not exists(env.deploy_basepath):
        run("mkdir -p "+env.deploy_basepath+"logs")
    if not exists("/data/logs"):
        run("sudo mkdir -p /data")
        run("sudo ln -s "+(env.deploy_basepath+"logs")+" /data/logs")
    if not exists(deploy_path):
        run("mkdir -p "+deploy_path+env.exec_dir_name)
        run("mkdir -p "+deploy_path+"bak")

def project_put(source_dir, target_dir):
    result = put(source_dir, target_dir)
    if result.failed and not confirm("put file failed, Continue[Y/NO]?"):
        abort("aborting!")

def project_port_stop(port):
    with settings(warn_only=True):
        result = run("sudo netstat -lnp|grep "+port+"|awk '{print $7}'|awk -F '/' '{print $1}'")
        if result:
            run("kill -9 "+result)

def project_clean(exec_dir,deploy_dir):
    run('cp -f '+exec_dir+'/* '+deploy_dir+'bak')
    run('rm -rf '+exec_dir+'/*')

def project_start(exec_dir, jar_name, tmp_path, project_name):
    with settings(warn_only=True):
        with cd(exec_dir):
            run("set -m; nohup java -server -Xms256m -Xmx512m -Xss512k -XX:MetaspaceSize=64m -XX:MaxMetaspaceSize=256m -Djava.io.tmpdir="+tmp_path+project_name+" -jar -Dspring.profiles.active=500 "+jar_name+" >/dev/null 2>&1 &")

def project_deploy(project_name, port):
    deploy_dir = env.deploy_basepath + project_name+'/'
    exec_dir = deploy_dir + env.exec_dir_name
    jar_name =  project_name + env.postfix
    //创建本地文件
    project_init_dir(deploy_dir,tmp_path, project_name)
    //本地从git拉取代码
    project_update(env.project_parent_dir)
    //本地打包
    project_package(env.project_parent_dir, project_name)
    //停止远程服务
    project_port_stop(port)
    //备份远程jar包，并将原有jar清除
    project_clean(exec_dir,deploy_dir)
    //将本地jar传输到远程
    project_put(env.project_parent_dir+'target/'+jar_name, exec_dir+'')
    //启动远程项目
    project_start(exec_dir, jar_name, tmp_path, project_name)

@task
@roles('all')
def ps_penguin():
   project_deploy('ps-penguin', '8804')

package cn.zcyun.xcloud.utils.security;

import java.nio.charset.StandardCharsets;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 * Blowfish算法工具
 * @author wenzhen
 *
 */
public class BlowfishUtils {
	
	public static void main(String[] args) throws Exception {
		String key = "873e597b";
        String a = encrypt("zzzzzz", key);
        System.out.println(a);
        System.out.println(decrypt(a, key));
    }
 
	/**
	 * 加密
	 * @param text
	 * @param key
	 * @return
	 * @throws Exception
	 */
    public static String encrypt(String text, String key) throws Exception {
        byte[] keyData = key.getBytes(StandardCharsets.UTF_8);
        SecretKeySpec secretKeySpec = new SecretKeySpec(keyData, "Blowfish");
        Cipher cipher = Cipher.getInstance("Blowfish/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
        byte[] hasil = cipher.doFinal(text.getBytes(StandardCharsets.UTF_8));
        return Hex.encodeHexStr(hasil);
    }
    
    /**
     * 解密
     * @param string
     * @param key
     * @return
     * @throws Exception
     */
    public static String decrypt(String string, String key) throws Exception {
        byte[] keyData = key.getBytes(StandardCharsets.UTF_8);
        SecretKeySpec secretKeySpec = new SecretKeySpec(keyData, "Blowfish");
        Cipher cipher = Cipher.getInstance("Blowfish/ECB/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
        byte[] hasil = cipher.doFinal(Hex.decodeHex(string.toCharArray()));
        return new String(hasil, StandardCharsets.UTF_8);
    }

}

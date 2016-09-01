package com.java.portal.utilities;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;

/**
 * @author rjk6kor
 *
 */
@Component
public class MD5Hashing {

	/**
	 * generateMD5Hash generates MD5 hashcode for the input
	 * 
	 * @param input
	 * @return
	 */

	public static String generateMD5Hash(String input) {

		String md5 = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(input.getBytes());

			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1)
					hexString.append('0');
				hexString.append(hex);
			}
			md5 = hexString.toString();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return md5;
		}

	}
	
	public static void main(String[] args){
		System.out.println(generateMD5Hash("nvidia"));
	}
	
	
}

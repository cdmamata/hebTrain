package com.ysq.hebtrain.test;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.commons.codec.digest.DigestUtils;

public class Sha1Test {

	
	public static void main(String[] args) {
		String s = "d033e22ae348aeb5660fc2140aec35850c4da997";
		
		String text = "admin";
		String sha1 = DigestUtils.sha1Hex(text);
		
		try {
			String a = URLEncoder.encode("测试", "UTF-8");
			
			System.out.println(a);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.out.println(s);
		System.out.println(sha1);
		
		System.out.println(s.equals(sha1));
	}
	
}

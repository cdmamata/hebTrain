package com.ysq.hebtrain.test;

import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class JsoupTest {

	public static void jsoupGet(){
		
		String url = "http://localhost:8080/hebTrain/servlet/testser";
		
		try {
			URL u = new URL(url);
			Document htmlDoc = Jsoup.parse(u, 10000);
			
			System.out.println(htmlDoc.html());
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public static void jsoupPost(){
		
	}
	
	public static void main(String[] args) {
		
		jsoupGet();
		
		//jsoupPost();
		
	}
	
}

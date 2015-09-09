package com.ysq.hebtrain.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SomethingTest {

	
	public static void regexTest(){
		String text = "asdfsafddsadata:{\"id\":1962551,\"onceTime\":obj.onceTime,\"inputvalcode\":inputvalcode1,\"drawerId\":1547,\"validateType\":validateType,\"token\":token}sdf sdg";
		
		String dataRegex = "data\\s*:\\s*\\{.*drawerId.*\\}";
		
		Pattern patt = Pattern.compile(dataRegex);
		
		Matcher match = patt.matcher(text);
		
		if(match.find()){
			String dataText = match.group();
			
			int index = dataText.indexOf("\"id\"");
			
			if(index > 0){
				int start = dataText.indexOf(":", index);
				
				int end = dataText.indexOf(",", start);
				
				String idStr = dataText.substring(start + 1, end) + "  ".trim();
				
				
				System.out.println(idStr);
			}
			
		}
		
	}
	
	public static void getLearnTime(){
		String text = "obj.leastTime=75; \n obj.learningTime=150; \n aaa";
		
		String timeRegex = "obj\\.learningTime\\s*=\\s*\\d+;?";
		
		Pattern timePatt = Pattern.compile(timeRegex);
		
		Matcher timeMatch = timePatt.matcher(text);
		
		if(timeMatch.find()){
			String dataText = timeMatch.group();
			
			String clearRegex = "\\d+";
			Pattern clearPatt = Pattern.compile(clearRegex);
			
			Matcher clearMatch = clearPatt.matcher(dataText);
			if(clearMatch.find()){
				String clearText = clearMatch.group();
				
				System.out.println(clearText);
			}
			
			
			System.out.println(dataText);
		}
		
		
	}
	
	
	
	public static void main(String[] args) {
		//regexTest();
		getLearnTime();
		
	}
	
}

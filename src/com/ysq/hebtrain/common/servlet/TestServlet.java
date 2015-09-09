package com.ysq.hebtrain.common.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void printAjaxResult(HttpServletResponse response, String result){
		response.setContentType("text/html;charset=utf-8");
		
		//获得输出流
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//将数据写入输出流
		out.print(result);
		//清楚数据流缓冲区
		out.flush();
		//关闭输出流
		out.close();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("get ... ");
		
		printAjaxResult(response, "get 测试 ... ");
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("post ... ");
		
		printAjaxResult(response, "post 测试 ... ");
	}


}

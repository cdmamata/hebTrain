package com.ysq.hebtrain.common.util;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.alibaba.fastjson.JSON;

/**
 * 常用工具类
 * @author Administrator
 *
 */
public class CommonUtil {
	static Logger logger = getLogger(CommonUtil.class);
	
	/**
	 * 获得log4j logger 对象
	 * @param clazz
	 * @return
	 */
	public static Logger getLogger(Class<?> clazz){
		Logger logger = Logger.getLogger(clazz);
		return logger;
	}
	
	/**
	 * Filter the specified message string for characters that are sensitive in
	 * HTML. This avoids potential attacks caused by including JavaScript codes
	 * in the request URL that is often reported in error messages.
	 * 
	 * @param message The message string to be filtered
	 */
	public static String filter(String message) {

		if (message == null){
			return (null);
		}
		char content[] = new char[message.length()];
		message.getChars(0, message.length(), content, 0);
		StringBuilder result = new StringBuilder(content.length + 50);
		for (int i = 0; i < content.length; i++) {
			switch (content[i]) {
			case '<':
				result.append("&lt;");
				break;
			case '>':
				result.append("&gt;");
				break;
			case '&':
				result.append("&amp;");
				break;
			case '"':
				result.append("&quot;");
				break;
			default:
				result.append(content[i]);
			}
		}
		return (result.toString());

	}
	
	/**
	 * 往session 中存数据
	 * @param name
	 * @param obj
	 */
	public static void setSessionAttribute(String name,Object obj){
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		session.setAttribute(name, obj);
	}
	
	/**
	 * 从 session 中获得数据
	 */
	public static Object getSessionAttribute(String name){
		HttpSession session = ServletActionContext.getRequest().getSession();
		Object object = session.getAttribute(name);
		return object;
	}
	
	/**
	 * 从 request 中获得数据
	 * @param name
	 * @return
	 */
	public static String getRequestParameter(String name){
		String value = ServletActionContext.getRequest().getParameter(name);
		return value;
	}
	
	/**
	 * 从 request 中获得数据
	 * @param name
	 * @return
	 */
	public static Object getRequestAttribute(String name){
		Object obj = ServletActionContext.getRequest().getAttribute(name);
		return obj;
	}
	
	/**
	 * 向 request 中存数据
	 * @param name
	 * @return
	 */
	public static void setRequestAttribute(String name,Object obj){
		ServletActionContext.getRequest().setAttribute(name, obj);
	}
	
	/**
	 * 获得request
	 * @return
	 */
	public static HttpServletRequest getRequest(){
		HttpServletRequest request = ServletActionContext.getRequest();
		return request;
	}
	
	/**
	 * 获得response
	 * @return
	 */
	public static HttpServletResponse getResponse(){
		HttpServletResponse response = ServletActionContext.getResponse();
		return response;
	}
	
	/**
	 * 输出 Ajax 返回的内容
	 */
	public static void printAjaxResult(String result){
		logger.debug("pringResult=>" + result);
		//获得response
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置输出UTF-8编码
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
	
	/**
	 * 获得分页grid json
	 * @param total
	 * @param itemList
	 * @return {total: 3,items: [{...}]}
	 */
	public static String getGridPageJson(int total,List<?> itemList){
		Map<String, Object> gridDataMap = new HashMap<String, Object>();
		
		gridDataMap.put("total", total);
		gridDataMap.put("items", itemList);
		
		String resultJson = JSON.toJSONString(gridDataMap);
		return resultJson;
	}
	
	/**
	 * 返回ajax执行结果
	 * @param isSuccess
	 * @param msg
	 * @return
	 */
	public static String returnAjaxJson(boolean isSuccess,String msg){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", isSuccess);
		resultMap.put("msg", msg);
		String json = JSON.toJSONString(resultMap);
		return json;
	}
	
	/**
	 * 返回ajax执行结果
	 * @param isSuccess
	 * @param msg
	 * @return
	 */
	public static String returnAjaxJson(boolean isSuccess, String msg, Map<String, String> map){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", isSuccess);
		resultMap.put("msg", msg);
		resultMap.putAll(map);
		
		String json = JSON.toJSONString(resultMap);
		return json;
	}
	
	/**
	 * 通过 beanId 获得 bean
	 * 基于 servlet 容器
	 * @param beanId
	 * @return
	 */
	public static Object getSpringBean(String beanId){
		//ServletContext context = ServletActionContext.getServletContext();
		//WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(context);
		
		//Object obj = wac.getBean(beanId);
		return null;
	}
	
	/**
	 * 获得connection
	 * @return
	 */
	public static Connection getConnectionFromSpring(String beanId) throws Exception{
		DataSource dbSource = (DataSource) getSpringBean(beanId);
		Connection con = dbSource.getConnection();
		return con;
	}
	
	/**
	 * 获得 hashId
	 * @param text
	 * @return
	 */
	public static long getHashId(String text){
		//Lookup3Hash hash = new Lookup3Hash();
		long result = 0;
		return result;
	}
	
	/**
	 * 拼接字符串
	 * @param list
	 * @return
	 */
	public static String listToString(List<String> list){
		StringBuilder builder = new StringBuilder();
		int i = 0;
		for(String oneText : list){
			if(i > 0){
				builder.append(",");
			}
			builder.append(oneText);
		}
		return builder.toString();
	}
	/**
	 * 转换IP地址
	 * @param ip
	 * @return
	 */
	public static String getIpStringFromBytes(long ip) {
		StringBuilder sb = new StringBuilder();
        sb.append(ip >> 24);
        sb.append('.');
        sb.append(ip >> 16 & 0xFF);
        sb.append('.');
        sb.append(ip >> 8 & 0xFF);
        sb.append('.');
        sb.append(ip & 0xFF);
        return sb.toString();
    }
	
	/**
	 * ha1 加密
	 * @param text
	 * @return
	 */
	public static String getHa1Encrypt(String text){
		String result = DigestUtils.sha1Hex(text);
		return result;
	}
	
	/**
	 * 向文本中写数据
	 * @param text
	 * @param filePath
	 * @param append
	 */
	public static void writeTextToFile(String filePath, String text, boolean append){
		FileWriter writer = null;
		try {
			writer = new FileWriter(filePath,append);
			
			writer.write(text);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(writer != null){
				try {
					writer.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 获得 web项目主目录
	 * @return
	 */
	public static String getBasicPath(){
		String path = ServletActionContext.getServletContext().getRealPath("/");
		return path;
	}

	public static void main(String[] args) {
		Set<String> fieldSet = new HashSet<String>();
		
		fieldSet.add("url");
		fieldSet.add("title");
		fieldSet.add("contentid");
		
	}
	
}

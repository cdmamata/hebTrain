package com.ysq.hebtrain.common.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import org.apache.log4j.Logger;

import com.ysq.hebtrain.common.util.CommonUtil;

/**
 * 初始化常量的自启动servlert类
 * @author Administrator
 *
 */
public class ConstantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = CommonUtil.getLogger(ConstantServlet.class);

	public void init() throws ServletException {
		logger.info("init servle ...");
		
		String rootPath = getServletContext().getRealPath("/");//项目主路径
		
		String directory = "WEB-INF/classes/config/properties/systemConfig.properties";
		String configPath = rootPath + directory;//properties 文件路径
		
		System.out.println(configPath);
		
		//结束
		logger.info("servlet init has been successfully completed ... ");
	}
}

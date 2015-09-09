package com.ysq.hebtrain.common.config;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;

/**
 * 通过配置文件，在启动时，初始化
 * @author Administrator
 *
 */
public class ConfigInfo {
	public final static String SESSION_USER = "sessionLoginUser";//存入session 的key
	
	public final static String TEACHER_SESSION_USER = "teacherSessionUser";//存入session 的key
	
	/** 不需要拦截的 action **/
	public final static String opActionValue = "opfun";
	/** 需要拦截的 action **/
	public final static String actionValue = "fun";
	
	/** 配置文件路径 */
	public static String properties_path = "/config/properties/dbConfig.properties";
	
	public static String noPermissionPage = "page/common/basic/noPermission.jsp";
	
	/** ================================================== **/
	/**
	 * 初始化 config
	 * @throws ConfigurationException 
	 * @throws ConfigurationException 
	 */
	public static void initConfig(String filePath) throws Exception{
		PropertiesConfiguration config = new PropertiesConfiguration(filePath);
		
		/** ======================================== 开始初始化 ======================================== **/
		/** ==================== kafka config ==================== **/
		if(config.containsKey("zookeeperConnect")){
			//zookeeperConnect = config.getString("zookeeperConnect");
			
		}
	}
}

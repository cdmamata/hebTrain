package com.ysq.hebtrain.common.dbsource;

public class DBSourceManager {
	/** ==================== DBSource key ==================== **/
	/** public **/
	public static String publicDBSource = "public";
	
	/** default mddb **/
	public static String mdDBSource = "mddb";
	
	/**
	 * mddb 数据源
	 */
	public static void setMdDB(){
		DataSourceHandle.setDataSourceType(mdDBSource);
	}
	
	/**
	 * 将数据源改为默认的数据源
	 */
	public static void setDefaultDB(){
		setMdDB();
	}
}

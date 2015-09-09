package com.ysq.hebtrain.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 时间工具类
 * @author Administrator
 *
 */
public class DateUtil {

	/**
	 * 毫秒时间戳 + 随机数
	 * @return string 时间戳
	 */
	public static String getNanoRandom() {
		long time = System.nanoTime();
		Random random = new Random();
		time += random.nextInt(999999999);
		return String.valueOf(time);
	}
	
	/**
	 * 得到当前时间时间
	 * @param 时间格式
	 * @return string 按格式返回当前时间
	 */
	public static int getCurrentDay() {
		long time = System.currentTimeMillis();
		Date date = new Date(time);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		int day = Integer.parseInt(sdf.format(date));
		return day;
	}
	
	/**
	 * 获得当前日期
	 * @return
	 */
	public static String getNowDay(String dayType){
		
		Date date = new Date();
		
		SimpleDateFormat format = new SimpleDateFormat(dayType);
		
		String resultDay = format.format(date);
		
		return resultDay;
	}
	
	/**
	 * 将 2014-01-11 这样的日期转换成 20140211
	 * @param day
	 * @return
	 */
	public static long parseDayToLong(String day){
		long longDay = new Long(day.replaceAll("-", ""));
		
		return longDay;
	}
	
	/**
	 * 将日期转成成字符串
	 * @param date
	 * @param formatType
	 * @return
	 */
	public static String dateToString(Date date, String formatType){
		SimpleDateFormat dateFormat = new SimpleDateFormat(formatType);
		String resultDate = dateFormat.format(date);
		return resultDate;
	}
	
	/**
	 * 字符串转日期
	 * @param dateString
	 * @param formatType
	 * @return
	 */
	public static Date stringToDate(String dateString, String formatType){
		SimpleDateFormat dateFormat = new SimpleDateFormat(formatType);
		Date resultDate = null;
		try {
			resultDate = dateFormat.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultDate;
	}
	
	/**
	 * 截取日期月份
	 * @param 日期格式 2012-09-07
	 * @return string 1209
	 */
	public static String dateForMonth(String date) {
		if (date == null) {
			return null;
		}
		String date_sub = date.replaceAll("-", "");
		return date_sub.substring(2, 6);
	}
	
	/**
	 * 转换日期格式
	 * @param dateString
	 * @param oldFormat
	 * @param newFormat
	 * @return
	 */
	public static String formatDateString(String dateString, String oldFormat, String newFormat){
		Date oldDate = stringToDate(dateString, oldFormat);
		String newDateString = dateToString(oldDate, newFormat);
		return newDateString;
	}
	
	public static void main(String[] args) {
		
		String day = getNowDay("yyyyMMdd");
		
		System.out.println("####LastHourDay : " + day);
	}

}

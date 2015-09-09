package com.ysq.hebtrain.common.util.ocr;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.imageio.ImageIO;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.Connection.Response;
import com.ysq.hebtrain.common.util.CommonUtil;

/**
 * 验证码识别
 * @author Administrator
 *
 */
public class ImageValidator {
	Logger logger = CommonUtil.getLogger(this.getClass());

	String basePath;
	
	private String downloadPath;
	private String resultPath;
	private String trainPath;
	
	public ImageValidator(String basePath){
		//会在basePath 下生成如下文件夹
		/*
		basePath
		    |--outside
		    |   |--ocr
		    |   |   |
		    |   |   |-download  图片下载目录
		    |   |   |-result    结果目录（不一定保存）
		    |--img 
		        |--ocr
		            |--train   训练图片
		*/
		this.basePath = basePath;
		
		this.downloadPath = basePath + "outside/ocr/download/";
		this.resultPath = basePath + "outside/ocr/result/";
		this.trainPath = basePath + "img/ocr/train/";
		initDirs();
	}
	
	/**
	 * 创建文件夹
	 * @param path
	 */
	public void makeDirs(String path){
		File file = new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
	}
	/**
	 * 初始化目录结构
	 */
	public void initDirs(){
		makeDirs(downloadPath);
		makeDirs(resultPath);
		makeDirs(trainPath);
	}
	
	public String getDownloadPath(){
		return downloadPath;
	}
	public String getResultPath() {
		return resultPath;
	}
	public String getTrainPath() {
		return trainPath;
	}

	/**
	 * 黑色判断
	 * @param colorInt
	 * @return
	 */
	public int isBlack(int colorInt) {
		Color color = new Color(colorInt);
		if (color.getRed() + color.getGreen() + color.getBlue() <= 600) {//图片解析度较高
			return 1;
		}
		return 0;
	}
	
	/**
	 * 白色判断
	 * @param colorInt
	 * @return
	 */
	public int isWhite(int colorInt) {
		Color color = new Color(colorInt);
		if (color.getRed() + color.getGreen() + color.getBlue() > 600) {
			return 1;
		}
		return 0;
	}

	/**
	 * 去掉背景
	 * @param picFile
	 * @return
	 * @throws Exception
	 */
	public BufferedImage removeBackgroud(String picFile)throws Exception {
		BufferedImage img = ImageIO.read(new File(picFile));
		int width = img.getWidth();
		int height = img.getHeight();
		for (int x = 0; x < width; ++x) {
			for (int y = 0; y < height; ++y) {
				if (isWhite(img.getRGB(x, y)) == 1) {
					img.setRGB(x, y, Color.WHITE.getRGB());
				} else {
					img.setRGB(x, y, Color.BLACK.getRGB());
				}
			}
		}
		return img;
	}

	
	public BufferedImage removeBlank(BufferedImage img) throws Exception {
		int width = img.getWidth();
		int height = img.getHeight();
		int start = 0;
		int end = 0;
		Label1: for (int y = 0; y < height; ++y) {
			for (int x = 0; x < width; ++x) {
				if (isBlack(img.getRGB(x, y)) == 1) {
					start = y;
					break Label1;
				}
			}
		}
		Label2: for (int y = height - 1; y >= 0; --y) {
			for (int x = 0; x < width; ++x) {
				if (isBlack(img.getRGB(x, y)) == 1) {
					end = y;
					break Label2;
				}
			}
		}
		return img.getSubimage(0, start, width, end - start + 1);
	}

	/**
	 * 切分图片
	 * @param img
	 * @return
	 * @throws Exception
	 */
	public List<BufferedImage> splitImage(BufferedImage img)throws Exception {
		List<BufferedImage> subImgList = new ArrayList<BufferedImage>();
		int width = img.getWidth();
		int height = img.getHeight();
		List<Integer> weightList = new ArrayList<Integer>();
		//{0, 0, 3, 5, 5, 0, 0, 1, 2, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
		for (int x = 0; x < width; ++x) {
			int count = 0;
			for (int y = 0; y < height; ++y) {
				if (isBlack(img.getRGB(x, y)) == 1) {
					count++;
				}
			}
			weightList.add(count);
		}
		for (int i = 0; i < weightList.size(); i++) {
			int oneWidth = 0;
			int startX = i;
			
			int oneX = weightList.get(i);
			if(oneX > 0){//说明当前x 坐标中 有像素点，坐标后移，直到下一次为0时
				for(int y = i; y<weightList.size(); y++){
					int twoX = weightList.get(y);
					
					if(twoX <= 0){//找到了下一次分割点
						i = y;
						break;
					}else{
						oneWidth++; //宽度+1
					}
				}
			}
			
			if(oneWidth > 0){
				BufferedImage oneImg = img.getSubimage(startX, 0, oneWidth, height);
				
				oneImg = removeBlank(oneImg);
				subImgList.add(oneImg);
			}
		}
		return subImgList;
	}
	
	public List<BufferedImage> splitImage2(BufferedImage img)throws Exception {
		List<BufferedImage> subImgs = new ArrayList<BufferedImage>();
		int width = img.getWidth();
		int height = img.getHeight();
		List<Integer> weightlist = new ArrayList<Integer>();
		for (int x = 0; x < width; ++x) {
			int count = 0;
			for (int y = 0; y < height; ++y) {
				if (isBlack(img.getRGB(x, y)) == 1) {
					count++;
				}
			}
			weightlist.add(count);
		}
		for (int i = 0; i < weightlist.size();) {
			int length = 0;
			while (weightlist.get(i++) > 1) {
				length++;
			}
			if (length > 12) {
				subImgs.add(removeBlank(img.getSubimage(i - length - 1, 0,
						length / 2, height)));
				subImgs.add(removeBlank(img.getSubimage(i - length / 2 - 1, 0,
						length / 2, height)));
			} else if (length > 3) {
				subImgs.add(removeBlank(img.getSubimage(i - length - 1, 0,
						length, height)));
			}
		}
		return subImgs;
	}
	
	/**
	 * 与训练的图片匹配
	 * @return
	 * @throws Exception
	 */
	public Map<String, BufferedImage> loadTrainData() throws Exception {
		String trainDir = getTrainPath();
		Map<String, BufferedImage> map = new HashMap<String, BufferedImage>();
		File dir = new File(trainDir);
		
		File[] files = dir.listFiles();
		for (File file : files) {
			String fileName = file.getName().charAt(0) + "";
			map.put(fileName, ImageIO.read(file));
		}
		return map;
	}

	/**
	 * 匹配
	 * @param img
	 * @param map
	 * @return
	 */
	public String getSingleCharOcr(BufferedImage img, Map<String, BufferedImage> map) {
		String result = "";
		int width = img.getWidth();
		int height = img.getHeight();
		
		double min = width * height * 0.2;
		//double total = width * height;
		
		for (String key : map.keySet()) {
			BufferedImage bi = map.get(key);
			
			int traWidth = bi.getWidth();
			int traHeight = bi.getHeight();
			
			int count = 0;//像素不匹配计数
			int minWidth = width < traWidth ? width : traWidth;
			int minHeight = height < traHeight ? height : traHeight;
			Label1: for (int x = 0; x < minWidth; x++) {
				for (int y = 0; y < minHeight; y++) {
					if (isBlack(img.getRGB(x, y)) != isBlack(bi.getRGB(x, y))) {//不匹配
						count++;
						if (count >= min){
							break Label1;
						}
					}
				}
			}
			if (count < min) {
				min = count;
				result = key;
				break;
			}
		}
		return result;
	}

	/**
	 * 获得图片 ocr 文本
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public String getAllOcr(String file) throws Exception {
		String resultDir = getResultPath();
		
		BufferedImage img = removeBackgroud(file);
		List<BufferedImage> listImg = splitImage(img);
		Map<String, BufferedImage> map = loadTrainData();
		String result = "";
		int i = 1;
		for (BufferedImage bi : listImg) {
			ImageIO.write(bi, "JPG", new File(resultDir + "result-" + i + ".jpg"));
			
			i++;
			result += getSingleCharOcr(bi, map);
		}
		ImageIO.write(img, "JPG", new File(resultDir + result + ".jpg"));
		return result;
	}

	/**
	 * 下载图片
	 * @param imgUrl
	 * @param imgName
	 * @param cookies
	 * @return
	 * @throws Exception
	 */
	public String downloadImage(String imgUrl, String imgName, Map<String, String> cookies) throws Exception{
		String imgPath = downloadPath + imgName;
		
		// output here
		FileOutputStream out = null;
		try {
			Response response = null;
			if(cookies != null){
				response = Jsoup.connect(imgUrl)
					.cookies(cookies)
					.ignoreContentType(true)
					.timeout(60000)
					.execute();
			}else{
				response = Jsoup.connect(imgUrl)
					.ignoreContentType(true)
					.timeout(60000)
					.execute();
			}
			 
			out = (new FileOutputStream(new File(imgPath)));
			out.write(response.bodyAsBytes());
		}finally{
			try {
				out.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return imgPath;
	}

	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args){
		String basePath = "F:/unSetUp/hebTrain/apache-tomcat-8.0.20/webapps/hebTrain/";
		
		ImageValidator impre = new ImageValidator(basePath);
		
		String url = "http://hb2015.px.teacher.com.cn/validateCode?0.32248710677959035";
		
		for (int i = 1; i < 30; ++i) {
			String imgName = i + ".jpg";
			
			try {
				String imgPath = impre.downloadImage(url, imgName, null);
				
				String text = impre.getAllOcr(imgPath);
				System.out.println(imgName + " : " + text);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

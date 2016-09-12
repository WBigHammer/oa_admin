package com.oa.commons.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;

public class ImageUtil {

	private File input;
	
	private BufferedImage bufferedImage;

	public int getHeight() {
		return bufferedImage.getHeight();
	}
	public int getWidth() {
		return bufferedImage.getWidth();
	}
	public ImageUtil(File imageFile) {
		
		input = imageFile;
		try {
			this.bufferedImage = ImageIO.read(input);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ImageUtil(String Path) {
		this(new File(Path));
	}
	public ImageUtil(URL url){
		try {
			this.bufferedImage = ImageIO.read(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean intelligenceScale(int width, int height){
//		int startX = 0, startY = 0,new_h=0,new_w=0;
//		if(this.getHeight()<height||this.getWidth()<width){
//			return false;
//		}
//		if(this.getHeight()*width>this.getWidth()*height){
//			new_h = this.getWidth()*height/width;
//			new_w = this.getWidth();
//			startY = (this.getHeight() - new_h)/2;
//		}else{
//			new_w = this.getHeight()*width/height;
//			new_h = this.getHeight();
//			startX = (this.getWidth() - new_w)/2;
//		}
//		this.bufferedImage = Scalr.crop(this.bufferedImage,startX, startY, startX+new_w, startY+new_h);
		
//		System.out.println(this.bufferedImage.getHeight());
//		
//		System.out.println(this.bufferedImage.getWidth());
		if((this.bufferedImage = Scalr.resize(this.bufferedImage, Scalr.Method.SPEED, Scalr.Mode.FIT_EXACT, width, height,Scalr.OP_ANTIALIAS)) != null){
			return true;
		}
		return false;
	}

	public void saveAs(String string) {
		try {
			ImageIO.write(bufferedImage, "jpg", new File(string));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
/**
 * 
 * 	int startX = 0, startY = 0,new_h=0,new_w=0;
		if(this.getHeight()<height||this.getWidth()<width){
			return null;
		}
		if(this.getHeight()*width>this.getWidth()*height){
			new_h = this.getWidth()*height/width;
			new_w = this.getWidth();
			startY = (this.getHeight() - new_h)/2;
		}else{
			new_w = this.getHeight()*width/height;
			new_h = this.getHeight();
			startX = (this.getWidth() - new_w)/2;
		}
		this.crop(startX, startY, startX+new_w, startY+new_h);
		this.resize(width,height);
 * 
 */
}

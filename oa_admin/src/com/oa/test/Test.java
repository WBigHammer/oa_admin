/**  
 * @Project: jxoa
 * @Title: Test.java
 * @Package com.oa.test
 * @date 2013-4-2 上午10:47:50
 * @Copyright: 2013 
 */
package com.oa.test;



import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import junit.framework.TestCase;

/**
 * 
 * 类名：Test
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-2 上午10:47:50
 *
 */
public class Test extends TestCase{
	
	public void test() {
			File file=new File("d:/s/a/c.text");
			System.out.println("=="+file.getPath());
			
			
	}
	public static void main(String[] args) {
		String str = "<tr><td>111111111111111</td><td>222222222222</td></tr>";
		Pattern p = Pattern.compile("(<td>)(.*?)(</td>)");
		Matcher m = p.matcher(str);
		while(m.find()){
			System.out.println(m.group(2));
		}
//		while(m.matches()){
//			System.out.println(m.group(3));
//		}
	}
	 
	 public static String getSerialNumber(String drive) {
		  String result = "";
		    try {
		       
		    }
		    catch(Exception e){
		        e.printStackTrace();
		    }
		    return result.trim();
		  }
	 
	 
	
	
}

package com.oa.test.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.impl.util.json.JSONObject;

//import com.alibaba.dubbo.common.json.JSON;
//import com.alibaba.dubbo.common.json.JSONArray;
import com.oa.commons.util.DateUtil;
//import com.oa.manager.vcms.bean.PieDataModel;

public class Tests {
	
//	static Boolean b=true;
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void main(String[] args) {
		
//		String s=";5522;";
//		String[]ss=s.split(";");
//		for(String s1: ss){
//			if("".equals(s1))continue;
//			System.out.println(s1);
//		}
//		System.out.println(ss.length);
//		System.out.println(ss.toString());
			/*if(b) {
			b=false;
			Thread t=new Thread();
			t.start();
			System.out.println(111);
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			b=true;
		}*/
		
//		Date currentTime = new Date();
//		SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd ");
//		String dateString = formatter.format(currentTime); 
//		System.out.println(dateString);
//		
//		String s="5522";
//		System.out.println(s.indexOf(";"));
//		Timestamp loginTime=DateUtil.currentTimestamp();
//		System.out.println(loginTime);
		
		
//		String i="2147483647";
//		System.out.println(Long.parseLong(i));
//		System.out.println(Integer.parseInt(i));
		
		/*String s="1111abcd";
		s=s.replaceAll("[^0-9]", "");
		System.out.println(s);
		String m="crawlerWblink";
//		m=m.substring(2);
		System.out.println(m.substring(2));
		System.out.println(m);
*/
		/*String url="http://tv.kanketv.com/image/tv/android/360x480/4F/4F7B5FEA3A3740A747382.jpg";
		String uuid=url.substring(url.lastIndexOf("/")+1,url.lastIndexOf("."));
		System.out.println(uuid);
		*/
		
//			ArrayList<Integer> al=new ArrayList<Integer>();
//			al.add(123);
//			al.add(234);
//			System.out.println(al);
//			while(al.size()<10)al.add(0);
//			System.out.println(al.toString());
//			JSONObject J=new JSONObject();
//		JSONArray ja=new JSONArray();
//		JSON
//		ja.add(ele);
		String s="12";
		Float f=Float.parseFloat(s);
		System.out.println(f);
		Double d=Double.parseDouble(s);
		System.out.println(d);
		Float webcount=20f;
		Float clientcount=90f;
//		Float web=Float.valueOf(webcount);
//		Float webpercent= (float) (webcount%((webcount+clientcount)*100));
		Float webpercent= (float) (webcount*100/(webcount+clientcount));
		Float padpercent= (float) (clientcount*100/(webcount+clientcount));
		System.out.println(webpercent);
		System.out.println(padpercent);
//		List<PieDataModel> pielist=new ArrayList<PieDataModel>();
//		PieDataModel pdm=new PieDataModel();
//		pdm.setName("PAD");
//		pdm.setY(webpercent);
//		pielist.add(pdm);
//		System.out.println(pielist.toString());
		
		
		Map m1=new LinkedHashMap();
		m1.put("name", "PAD");
		m1.put("y", webpercent);
		Map m2 =new LinkedHashMap();
		m2.put("name", "WEB");
		m2.put("y", padpercent);
		List<String> l=new ArrayList<String>();
		l.add(m1.toString());
		l.add(m2.toString());
		System.out.println(l);
		
		
		/*PieDataModel pdm1=new PieDataModel();
		pdm1.setName("PAD");
		pdm1.setY(webpercent);
		PieDataModel pdm2=new PieDataModel();
		pdm2.setName("WEB");
		pdm2.setY(padpercent);
		List<String> l2=new ArrayList<String>();
		l2.add(pdm1.toString());
		l2.add(pdm2.toString());
		System.out.println(l2);
		*/
		
		
		String content="afagaba7878&*@`\t\b$%2B\\+";
		
		content = content.replaceAll("\\+", "%2B");
		//过滤敏感字符
		try {
			content = URLDecoder.decode(content, "UTF-8");
			System.out.println(content);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

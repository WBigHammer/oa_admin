package com.oa.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public class TestDel {

	public static void main(String[] args) {
		String requestUrl = "http://183.136.202.146:81/Imdb_video/app/log/handler.json?logType=parser&timerStr=20150305&keys=08b436979c6eb15a7ddcd573c05578ed";
		PrintWriter printWriter = null;
		BufferedReader bufferedReader = null;
		// BufferedReader bufferedReader = null;
		StringBuffer responseResult = new StringBuffer();
		StringBuffer params = new StringBuffer();
		HttpURLConnection httpURLConnection = null;

		try {
			URL realUrl = new URL(requestUrl);
			// 打开和URL之间的连接
			httpURLConnection = (HttpURLConnection) realUrl.openConnection();
			// 设置通用的请求属性
			httpURLConnection.setRequestProperty("accept", "*/*");
			httpURLConnection.setRequestProperty("connection", "Keep-Alive");
			httpURLConnection.setRequestProperty("Content-Length", String
					.valueOf(params.length()));
			// 发送POST请求必须设置如下两行
			httpURLConnection.setDoOutput(true);
			httpURLConnection.setDoInput(true);
			httpURLConnection.setRequestMethod("POST");
			// 获取URLConnection对象对应的输出流
			printWriter = new PrintWriter(httpURLConnection.getOutputStream());
			// 发送请求参数
			printWriter.write(params.toString());
			// flush输出流的缓冲
			printWriter.flush();
			// 根据ResponseCode判断连接是否成功
			int responseCode = httpURLConnection.getResponseCode();
			if (responseCode != 200) {
				System.out.println("failed:" + responseCode);
			} else {
				System.out.println("ok:" + responseCode);
			}
			// 定义BufferedReader输入流来读取URL的ResponseData
			bufferedReader = new BufferedReader(new InputStreamReader(
					httpURLConnection.getInputStream()));
			String line;
			while ((line = bufferedReader.readLine()) != null) {
				responseResult.append("/n").append(line);
			}
		} catch (Exception e) {
		} finally {
			httpURLConnection.disconnect();
			try {
				if (printWriter != null) {
					printWriter.close();
				}
				if (bufferedReader != null) {
					bufferedReader.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}

		}
	}
}

package com.oa.commons.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

//import com.oa.manager.vcms.util.TvVideoUtil;

/**
 * 读取自定义的配置文件
 * 
 * @author Administrator
 * 
 */
public class PropertyUtil extends PropertyPlaceholderConfigurer {

	private static Map<String, Object> ctxPropertiesMap;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected void processProperties(ConfigurableListableBeanFactory beanFactoryToProcess,Properties props) throws BeansException {
		super.processProperties(beanFactoryToProcess, props);
		ctxPropertiesMap = new HashMap<String, Object>();
		for (Object key : props.keySet()) {
			String keyStr = key.toString();
			String value = props.getProperty(keyStr);
			ctxPropertiesMap.put(keyStr, value);
			//对加点的进行解析,只做一个点的解析
			String[] keys = keyStr.split("\\.");
			if(keys.length==2){
				Object o  = ctxPropertiesMap.get(keys[0]);
				if(o==null){
					o= new HashMap<String, Object>();
					ctxPropertiesMap.put(keys[0], o);
				}
				((Map)o).put(keys[1], value);
				
			}
		}
			/*//初始化状态
			Object localdebug = com.oa.commons.util.PropertyUtil.getContextProperty("LOCALDEBUG");
			if(localdebug==null){
				TvVideoUtil.LOCALDEBUG=false;
			}else{
				String localdebug_ = localdebug.toString().trim();
				if(localdebug_.equals("true")){
					TvVideoUtil.LOCALDEBUG=true;
				}else{
					TvVideoUtil.LOCALDEBUG=false;
				}
			}*/
	}
	public static Object getContextProperty(String name) {
		return ctxPropertiesMap.get(name);
	}
}

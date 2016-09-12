package com.oa.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

//import com.vstartek.kanke.service.MovieService;
//import com.vstartek.kanke.service.TVService;

public class Comsumer {
	
	 public static void main(String[] args) throws Exception {
	        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"config/consumer.xml"});
	        context.start();
	 
//	        DemoService demoService = (DemoService)context.getBean("demoService"); // 获取远程服务代理
//	        MovieService movieService = (MovieService)context.getBean("movieService");
//	        TVService tvService = (TVService)context.getBean("tvService");
//	        
	        /**
	         * demoService
	         */
	        //sayHello方法
//	        System.out.println("输出调用接口结果：");
//	        System.out.println(demoService.sayHello("112")); 
//	        //根据ID标识查询数据库加载用户对象
//	        System.out.println(demoService.load(1));
	        
	        
	        /**
	         * MovieService
	         */
//	        String[] a = new String[]{} ;
//	        String[] b = new String[]{} ;
//	        System.out.println("列表"+movieService.list(a, b,"", 1, 10));
//	        
//	        System.out.println("id查找"+movieService.get(10));
	        
	        
	    }

}

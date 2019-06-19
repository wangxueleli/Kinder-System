package controller;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BasicServlet
 */
@WebServlet("/BasicServlet")
public class BasicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//编码字符集
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//根据路径判断调用的方法  从路径中获得方法名
		String path=request.getRequestURI();// web06/Admin/方法名
		System.out.println(path);
		//获得方法名
		String methodName=path.substring(path.lastIndexOf("/")+1);//Admin
		System.out.println(methodName);
		//获得类名
		String className=this.getClass().getSimpleName();
		System.out.println(className);
		 //System.out.println(methodName+":"+className);
		if(className.equals(methodName+"Servlet")|| className.equals(methodName)){
			System.out.println("--------路径错误--------------");
			//获得客户端发出请求的地址
			response.sendRedirect("error.jsp");
		}else{
			//定义方法
			Method method;
			try {
				//参数个数
				int params=0;
				try{
					method = this.getClass().getMethod(methodName);
				}catch(NoSuchMethodException  e){
					params=1;
					try{
						//获得方法
						method = this.getClass().getMethod(methodName, HttpServletRequest.class);
					}catch(NoSuchMethodException  ne){
						params=2;
						method=this.getClass().getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
					
					}
						
				}
				
			//定义返回值
			String   returnPath=null;
				if(method!=null){
					if(params==0){
						//调用方法
						returnPath=(String)method.invoke(this);
					}else  if(params==1){
						//调用方法
						returnPath=(String)method.invoke(this,request);
					}else  if(params==2){
						//调用方法
						returnPath=(String)method.invoke(this,request,response);
					}
					if(returnPath==null) {
						return;
					}
			// f定位转发     r 定义重定向
				String [] typeUrl=returnPath!=null?returnPath.split(":"):null;
				if(typeUrl!=null && typeUrl.length==2){
					if(typeUrl[0].equals("r")){
						response.sendRedirect(typeUrl[1]);
					}else  if(typeUrl[0].equals("f")){
						request.getRequestDispatcher(typeUrl[1]).forward(request, response);
					}else{
						System.out.println("------------请求路径有误---方法不存在-----");
						//获得客户端发出请求的地址
						response.sendRedirect("../error.jsp");
					}
					
					
				}else{
					System.out.println("------------请求路径有误---方法不存在-----2");
					//获得客户端发出请求的地址
					response.sendRedirect("../error.jsp");
				}
				
				}else{
					System.out.println("------------请求路径有误---方法不存在-----3");
					//获得客户端发出请求的地址
					response.sendRedirect("../error.jsp");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("------------请求路径有误---方法不存在-----4");
				//获得客户端发出请求的地址
				response.sendRedirect("../error.jsp");
			} 
		}
		//this==AdminServlet对象
		
		
	}

}



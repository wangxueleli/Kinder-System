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
		//�����ַ���
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//����·���жϵ��õķ���  ��·���л�÷�����
		String path=request.getRequestURI();// web06/Admin/������
		System.out.println(path);
		//��÷�����
		String methodName=path.substring(path.lastIndexOf("/")+1);//Admin
		System.out.println(methodName);
		//�������
		String className=this.getClass().getSimpleName();
		System.out.println(className);
		 //System.out.println(methodName+":"+className);
		if(className.equals(methodName+"Servlet")|| className.equals(methodName)){
			System.out.println("--------·������--------------");
			//��ÿͻ��˷�������ĵ�ַ
			response.sendRedirect("error.jsp");
		}else{
			//���巽��
			Method method;
			try {
				//��������
				int params=0;
				try{
					method = this.getClass().getMethod(methodName);
				}catch(NoSuchMethodException  e){
					params=1;
					try{
						//��÷���
						method = this.getClass().getMethod(methodName, HttpServletRequest.class);
					}catch(NoSuchMethodException  ne){
						params=2;
						method=this.getClass().getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
					
					}
						
				}
				
			//���巵��ֵ
			String   returnPath=null;
				if(method!=null){
					if(params==0){
						//���÷���
						returnPath=(String)method.invoke(this);
					}else  if(params==1){
						//���÷���
						returnPath=(String)method.invoke(this,request);
					}else  if(params==2){
						//���÷���
						returnPath=(String)method.invoke(this,request,response);
					}
					if(returnPath==null) {
						return;
					}
			// f��λת��     r �����ض���
				String [] typeUrl=returnPath!=null?returnPath.split(":"):null;
				if(typeUrl!=null && typeUrl.length==2){
					if(typeUrl[0].equals("r")){
						response.sendRedirect(typeUrl[1]);
					}else  if(typeUrl[0].equals("f")){
						request.getRequestDispatcher(typeUrl[1]).forward(request, response);
					}else{
						System.out.println("------------����·������---����������-----");
						//��ÿͻ��˷�������ĵ�ַ
						response.sendRedirect("../error.jsp");
					}
					
					
				}else{
					System.out.println("------------����·������---����������-----2");
					//��ÿͻ��˷�������ĵ�ַ
					response.sendRedirect("../error.jsp");
				}
				
				}else{
					System.out.println("------------����·������---����������-----3");
					//��ÿͻ��˷�������ĵ�ַ
					response.sendRedirect("../error.jsp");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("------------����·������---����������-----4");
				//��ÿͻ��˷�������ĵ�ַ
				response.sendRedirect("../error.jsp");
			} 
		}
		//this==AdminServlet����
		
		
	}

}



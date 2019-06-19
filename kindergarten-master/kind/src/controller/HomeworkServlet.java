package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.alibaba.fastjson.JSON;

import bean.Certificate;
import bean.Homework;
import service.HomeworkService;
import util.C3P0Utils;



/**
 * Servlet implementation class HomeworkServlet
 */
@WebServlet("/HomeworkServlet/*")
public class HomeworkServlet extends BasicServlet {
	HomeworkService hs=new HomeworkService();
	
	public String addtext(HttpServletRequest  request,HttpServletResponse response){
		//���ͼƬ
		String fileName = null;
		//1.���� �ļ�����
		DiskFileItemFactory   factory=new  DiskFileItemFactory();
		//2.�ļ��ϴ�����
		ServletFileUpload  fileUpload=new  ServletFileUpload(factory);
		 fileUpload.setHeaderEncoding("UTF-8");
		//����  
		Map<String, Object> map=new HashMap<>();
		//3.�ļ����� �����������
		try {
			List<FileItem>  list=fileUpload.parseRequest(request);
			//ѭ��
			for (FileItem fileItem : list) {
				//�ж����ļ������ֶ�
				if(fileItem.isFormField()){
					//�ֶη��뼯����
					
					map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
				}else{
					//�ļ�����
					 //�Ȱ�ͼƬ����  tomcat  Ȼ�󱸷�һ�� ��Ӳ�̶̹���λ��(F:/a/)   ��������ַ �������ݿ�
					////D:\apache-tomcat-7.0.78\webapps\web08\adminUploadHeadImg
					String  realPath=getServletContext().getRealPath("img");
					System.out.println(realPath);
					//�Լ�����һ���µ�����  ����������Ψһ    1.UUID  2.��ǰ����ֵ
					 fileName=getNewFileName(fileItem.getName());
					
					//��������������
					BufferedInputStream  buInputStream=new   BufferedInputStream(fileItem.getInputStream());
					//tomcat
					BufferedOutputStream  outTomcat=new BufferedOutputStream(new FileOutputStream(realPath+File.separator+fileName));
					//F:/a
					BufferedOutputStream  outFixed=new BufferedOutputStream(new FileOutputStream("D:/weixin/img"+File.separator+fileName));
					int  i;
					while((i=buInputStream.read())!=-1){
						outTomcat.write(i);
						outFixed.write(i);
					}
					outFixed.close();
					outTomcat.close();
				}
			}
		}catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String bigdec =(String) map.get("bigdec");
		String wx =(String) map.get("wx");
		String timeing = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String imgurl = "img/"+fileName;
		System.out.println(imgurl);
		boolean tf = hs.addtext(bigdec, wx, timeing,imgurl);
		if(tf) {
			List<Homework> listcer =hs.selectall();
			request.getSession().setAttribute("her", listcer);
			request.getSession().setAttribute("message4", "添加成功");
		}else {
			request.getSession().setAttribute("message4", "添加失败");
		}
		return "r:../homework.jsp";
	}

	public String select(HttpServletRequest request, HttpServletResponse response) {
		String wx = request.getParameter("wx");
		List<Homework> listcer;
		if (wx.equals("0")) {
			listcer = hs.selectall();
		} else {
			listcer = hs.selecwx(wx);
		}
		request.getSession().setAttribute("her", listcer);
		return "r:../homework.jsp";
	}
	
	public String selectbean(HttpServletRequest request, HttpServletResponse response) {
		String id =  request.getParameter("id");
		Homework homework =null;
		homework = hs.selectbean(id);
		request.getSession().setAttribute("homework", homework);
		return "r:../homeworkup.jsp";
	}
	public String update(HttpServletRequest request, HttpServletResponse response) {
		String id =  request.getParameter("id");
		String bigdec =  request.getParameter("bigdec");
		String wx =request.getParameter("wx");
		String timeing = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		boolean tf = hs.updatetext(bigdec, wx, timeing,id);
		if(tf) {
		List<Homework> listcer =hs.selectall();
		request.getSession().setAttribute("her", listcer);
		request.getSession().setAttribute("message4", "修改成功");
		}else {
			request.getSession().setAttribute("message4", "修改失败");
		}
		return "r:../homework.jsp";
	}
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		String arrId = request.getParameter("arrId");
		Object[] id= arrId.split(",");
		arrId = arrId.substring(0,arrId.length() - 1);
		Object[][]arrid = new Object[id.length][1];
		for(int i=0; i<id.length; i++ ) {
			for(int j=0;j<1;j++) {
				arrid[i][j]=id[i];
				System.out.println(arrid[i][j]);
			}
		}
		boolean tf = hs.delete(arrid);
		if(tf) {
			List<Homework> listcer =hs.selectall();
			request.getSession().setAttribute("her", listcer);
			request.getSession().setAttribute("message4", "删除成功");
			}else {
				request.getSession().setAttribute("message4", "删除失败");
			}
			return "r:../homework.jsp";
	}
	public void selectwx(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sql = "select * from t_homework where wx=1";
		List<Certificate> listwx=C3P0Utils.beanListHandler(sql, Certificate.class);
		String json=JSON.toJSONString(listwx);
		 PrintWriter  pw=response.getWriter();
		   pw.append(json);
		   pw.flush();
		   pw.close();
	}

	/**
	 * ��ȡ�ļ�����
	 * 
	 * @param part
	 * @return
	 */
	public String getNewFileName(String fileName) {// a.png
		int index = fileName.lastIndexOf(".");
		String name = UUID.randomUUID() + "";
		if (index != -1) {
			name += fileName.substring(index);
		}
		return name;
	}

}

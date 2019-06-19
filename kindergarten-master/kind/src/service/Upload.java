package service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Teacher;
import util.C3P0Utils;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Upload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 锟斤拷锟酵计�
		// 1.锟斤拷锟斤拷 锟侥硷拷锟斤拷锟斤拷
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 2.锟侥硷拷锟较达拷锟斤拷锟斤拷
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		// 锟斤拷锟斤拷
		Map<String, Object> map = new HashMap<>();
		// 3.锟侥硷拷锟斤拷锟斤拷 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
		try {
			List<FileItem> list = fileUpload.parseRequest(request);
			// 循锟斤拷
			for (FileItem fileItem : list) {
				// 锟叫讹拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟街讹拷
				if (fileItem.isFormField()) {
					// 锟街段凤拷锟诫集锟斤拷锟斤拷
					map.put(fileItem.getFieldName(), fileItem.toString());
				} else {
					//// D:\apache-tomcat-7.0.78\webapps\web08\adminUploadHeadImg
					String realPath = request.getServletContext().getRealPath("img");
					System.out.println(realPath);
					// 锟皆硷拷锟斤拷锟斤拷一锟斤拷锟铰碉拷锟斤拷锟斤拷 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷唯一 1.UUID 2.锟斤拷前锟斤拷锟斤拷值
					String fileName = getNewFileName(fileItem.getName());
					System.out.println(fileName);
					// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷
					BufferedInputStream buInputStream = new BufferedInputStream(fileItem.getInputStream());
					// tomcat
					BufferedOutputStream outTomcat = new BufferedOutputStream(
							new FileOutputStream(realPath + File.separator + fileName));
					// F:/a
					BufferedOutputStream outFixed = new BufferedOutputStream(new FileOutputStream(
							"C:\\Users\\admin\\Desktop\\kind\\WebContent\\img" + File.separator + fileName));
					int i;
					while ((i = buInputStream.read()) != -1) {
						outTomcat.write(i);
						outFixed.write(i);
					}
					outFixed.close();
					outTomcat.close();
					// 锟斤拷锟铰凤拷锟�
					map.put(fileItem.getName(), "img/" + fileName);
					String img = (String) map.get(fileItem.getName());
					map.put("realHeadimg","C:\\Users\\admin\\Desktop\\kind\\WebContent\\img" + File.separator + fileName);
					//
					request.getSession().setAttribute("path", "img/" + fileName);
					Integer id = ((Teacher) request.getSession().getAttribute("teacher")).getTeacherId();
					// db锟斤拷锟斤拷锟斤拷
					C3P0Utils util = new C3P0Utils();
					String sql = "update teacher set img=? where teacherId=?";
					util.update(sql, img, id);
				}
			}

		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (String feildName : map.keySet()) {
			System.out.println(feildName + ":" + map.get(feildName));
		}
		//response.sendRedirect("teachershow.jsp");
	}

	public String getNewFileName(String fileName) {// a.png
		int index = fileName.lastIndexOf(".");
		String name = UUID.randomUUID() + "";
		if (index != -1) {
			name += fileName.substring(index);
		}
		return name;
	}
}
package service;

import java.util.List;

import bean.Teacher1;
import dao.TeacherDao;



public class TeacherService {
	TeacherDao cc =new TeacherDao();
	public boolean addtext(String bigdec, String wx, String timeing, String imgurl) {
		return cc.addtext(bigdec, wx, timeing,imgurl);	
	}
	public List<Teacher1> selectall(){
		return cc.selectall();
	}
	
	public List<Teacher1> selecwx(String wx){
		return cc.selecwx(wx);
	}
	public Teacher1 selectbean(String id) {
		// TODO Auto-generated method stub
		return cc.selecbean(id);
	}
	public boolean updatetext(String bigdec, String wx, String timeing, String id) {
		// TODO Auto-generated method stub
		return cc.updatetext(bigdec, wx, timeing,id);
	}
	public boolean delete(Object[][] arrid) {
		// TODO Auto-generated method stub
		return cc.delete(arrid);
	}
}

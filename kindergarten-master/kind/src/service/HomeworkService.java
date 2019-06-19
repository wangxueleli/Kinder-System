package service;

import java.util.List;

import bean.Homework;
import dao.HomeworkDao;

public class HomeworkService {
	HomeworkDao hd = new HomeworkDao();
	public boolean addtext(String bigdec, String wx, String timeing, String imgurl) {
		return hd.addtext(bigdec, wx, timeing,imgurl);	
	}
	public List<Homework> selectall(){
		return hd.selectall();
	}
	
	public List<Homework> selecwx(String wx){
		return hd.selecwx(wx);
	}
	public Homework selectbean(String id) {
		// TODO Auto-generated method stub
		return hd.selecbean(id);
	}
	public boolean updatetext(String bigdec, String wx, String timeing, String id) {
		// TODO Auto-generated method stub
		return hd.updatetext(bigdec, wx, timeing,id);
	}
	public boolean delete(Object[][] arrid) {
		// TODO Auto-generated method stub
		return hd.delete(arrid);
	}
}

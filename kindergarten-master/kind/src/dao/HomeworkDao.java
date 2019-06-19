package dao;

import java.util.List;

import bean.Homework;
import util.C3P0Utils;

public class HomeworkDao {
	public boolean addtext(String bigdec, String wx, String timeing, String imgurl) {
		String sql= "insert into t_homework(bigdec,wx,timeing,imgurl) values(?,?,?,?)";
		return C3P0Utils.update(sql, bigdec, wx, timeing, imgurl);		
	}
	
	public List<Homework> selectall(){
		String sql = "select * from t_homework ORDER BY timeing DESC";	
		return C3P0Utils.beanListHandler(sql, Homework.class);		
	}
	
	public List<Homework> selecwx(String wx){
		String sql = "select * from t_homework where wx=? ORDER BY timeing DESC";	
		
		return C3P0Utils.beanListHandler(sql, Homework.class, wx);		
	}

	public Homework selecbean(String id) {
		String sql = "select * from t_homework where id=?";
		return  C3P0Utils.beanHandler(sql, Homework.class, id);
	}

	public boolean updatetext(String bigdec, String wx, String timeing, String id) {
		String sql = "update t_homework set bigdec=?, wx=?, timeing=? where id=?";
		return C3P0Utils.update(sql, bigdec, wx, timeing, id);
	}

	public boolean delete(Object[][] arrid) {
		String sql ="delete from t_homework where id=?" ;
		return  C3P0Utils.updateBybatch(sql, arrid);
	}
}

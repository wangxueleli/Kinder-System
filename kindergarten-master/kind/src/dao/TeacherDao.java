package dao;

import java.util.List;


import bean.Teacher1;
import util.C3P0Utils;

public class TeacherDao {
	public boolean addtext(String bigdec, String wx, String timeing, String imgurl) {
		String sql= "insert into t_teacher(bigdec,wx,timeing,imgurl) values(?,?,?,?)";
		return C3P0Utils.update(sql, bigdec, wx, timeing, imgurl);		
	}
	
	public List<Teacher1> selectall(){
		String sql = "select * from t_teacher ORDER BY timeing DESC";	
		return C3P0Utils.beanListHandler(sql, Teacher1.class);		
	}
	
	public List<Teacher1> selecwx(String wx){
		String sql = "select * from t_teacher where wx=? ORDER BY timeing DESC";	
		
		return C3P0Utils.beanListHandler(sql, Teacher1.class, wx);		
	}

	public Teacher1 selecbean(String id) {
		String sql = "select * from t_teacher where id=?";
		return  C3P0Utils.beanHandler(sql, Teacher1.class, id);
	}

	public boolean updatetext(String bigdec, String wx, String timeing, String id) {
		String sql = "update t_teacher set bigdec=?, wx=?, timeing=? where id=?";
		return C3P0Utils.update(sql, bigdec, wx, timeing, id);
	}

	public boolean delete(Object[][] arrid) {
		String sql ="delete from t_teacher where id=?" ;
		return  C3P0Utils.updateBybatch(sql, arrid);
	}
}

package dao;



import java.util.List;
import bean.Certificate;
import util.C3P0Utils;

public class CertificateDao {
	public boolean addtext(String bigdec, String wx, String timeing, String imgurl) {
		String sql= "insert into t_certificate(bigdec,wx,timeing,imgurl) values(?,?,?,?)";
		return C3P0Utils.update(sql, bigdec, wx, timeing, imgurl);		
	}
	
	public List<Certificate> selectall(){
		String sql = "select * from t_certificate ORDER BY timeing DESC";	
		return C3P0Utils.beanListHandler(sql, Certificate.class);		
	}
	
	public List<Certificate> selecwx(String wx){
		String sql = "select * from t_certificate where wx=? ORDER BY timeing DESC";	
		
		return C3P0Utils.beanListHandler(sql, Certificate.class, wx);		
	}

	public Certificate selecbean(String id) {
		String sql = "select * from t_certificate where id=?";
		return  C3P0Utils.beanHandler(sql, Certificate.class, id);
	}

	public boolean updatetext(String bigdec, String wx, String timeing, String id) {
		String sql = "update t_certificate set bigdec=?, wx=?, timeing=? where id=?";
		return C3P0Utils.update(sql, bigdec, wx, timeing, id);
	}

	public boolean delete(Object[][] arrid) {
		String sql ="delete from t_certificate where id=?" ;
		return  C3P0Utils.updateBybatch(sql, arrid);
	}
}

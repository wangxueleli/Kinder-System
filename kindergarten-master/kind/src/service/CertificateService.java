package service;

import java.util.List;

import bean.Certificate;
import dao.CertificateDao;

public class CertificateService {
	CertificateDao cc =new CertificateDao();
	public boolean addtext(String bigdec, String wx, String timeing, String imgurl) {
		return cc.addtext(bigdec, wx, timeing,imgurl);	
	}
	public List<Certificate> selectall(){
		return cc.selectall();
	}
	
	public List<Certificate> selecwx(String wx){
		return cc.selecwx(wx);
	}
	public Certificate selectbean(String id) {
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

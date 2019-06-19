package dao;

import java.util.List;


import util.C3P0Utils;

public class ReadyDao {

	public List select() {
		String sql="select grade.id, grade.classType from grade";
		return 	C3P0Utils.arrayListHandler(sql);
	}

	public List ajaxselect(String id) {
		String sql="SELECT t2.*, COUNT(t_ready.id) FROM "
				+ "(SELECT t1.id, t_class.num, t1.classType FROM "
				+ "(SELECT grade.id, grade.classType FROM grade WHERE id=?) AS t1 "
				+ "LEFT JOIN t_class ON t_class.idtype=?) AS t2 "
				+ "LEFT JOIN t_ready ON t_ready.type=?";
		return C3P0Utils.arrayListHandler(sql, id,id,id);
	}

	public boolean update(String classtype, String num) {
		String sql= "update t_class set num=? where idtype=?";
		return C3P0Utils.update(sql, num,classtype);
	}

	public List selectready() {
		String sql="select t_ready.*, grade.classType from t_ready, grade WHERE t_ready.type=grade.id";
		return C3P0Utils.arrayListHandler(sql);
	}

	public boolean delete(Object[][] arrid) {
		String sql ="delete from t_ready where id=?" ;
		return  C3P0Utils.updateBybatch(sql, arrid);
	}

	public List selectlimt() {
		String sql=" SELECT t_class.*, grade.classType FROM grade LEFT JOIN t_class ON t_class.idtype=grade.id";

		return C3P0Utils.arrayListHandler(sql);
	}

}

package dao;

import java.util.List;
import bean.Activity;
import util.C3P0Utils;

public class ActivityDao {
	C3P0Utils  c3P0UtiLs=new  C3P0Utils();
	public List<Activity> selectOne(){
		String sql="select  *  from  activity  ";
		return c3P0UtiLs.beanListHandler(sql, Activity.class );
	}
}

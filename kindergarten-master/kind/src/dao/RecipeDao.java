package dao;

import java.util.List;

import bean.Recipe;
import util.C3P0Utils;

public class RecipeDao {
	C3P0Utils  c3P0UtiLs=new  C3P0Utils();
	public List<Recipe> selectOne(){
		String sql="select  *  from  food  ";
		return c3P0UtiLs.beanListHandler(sql, Recipe.class );
	}
}

package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Activity;
import bean.Recipe;
import util.C3P0Utils;

/**
 * Servlet implementation class RecipeModificationServlet
 */
@WebServlet("/recipeModification")
public class RecipeModificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeModificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String week=request.getParameter("week");
		String breakfast=request.getParameter("breakfast");
		String lunch=request.getParameter("lunch");
		String supper=request.getParameter("supper");
		String sql="update recipe set  week=?, breakfast=?, lunch=?, supper=?   where id=?";
		C3P0Utils.update(sql, week, breakfast, lunch, supper,id);
		String sql1="select * from recipe ";
		List<Recipe> list=C3P0Utils.beanListHandler(sql1, Recipe.class);
		System.out.println(list.size()+"------------------");
		request.getSession().setAttribute("listRecipe", list);
		response.sendRedirect("recipe.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

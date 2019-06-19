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
 * Servlet implementation class RecipeDeleteServlet
 */
@WebServlet("/recipeDelete")
public class RecipeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String id=request.getParameter("id");
		 String sql ="delete from recipe where id=?";
		 C3P0Utils.update(sql, id);
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

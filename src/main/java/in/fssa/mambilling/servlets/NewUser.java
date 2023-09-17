package in.fssa.mambilling.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewUserServlet
 */
@WebServlet("/users/new")
public class NewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String where = request.getParameter("redirectedTo");
		// System.out.println(where+" - new User Servlet"); 
		request.setAttribute("where", where);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/add_user.jsp");
		dispatcher.forward(request, response);
	}
}

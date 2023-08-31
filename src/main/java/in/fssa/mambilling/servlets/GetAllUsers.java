package in.fssa.mambilling.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.mambilling.exception.ServiceException;
import in.fssa.mambilling.model.Product;
import in.fssa.mambilling.model.User;
import in.fssa.mambilling.service.PriceService;
import in.fssa.mambilling.service.ProductService;
import in.fssa.mambilling.service.UserService;

/**
 * Servlet implementation class GetAllUsers
 */
@WebServlet("/users")
public class GetAllUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		try {
			List<User> users = userService.getAllUsers();
			request.setAttribute("userList", users);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/user_list.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


}

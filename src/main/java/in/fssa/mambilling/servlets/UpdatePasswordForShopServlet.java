package in.fssa.mambilling.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.mambilling.exception.ServiceException;
import in.fssa.mambilling.service.ShopService;

/**
 * Servlet implementation class UpdatePasswordForShopServlet
 */
@WebServlet("/updatepassword")
public class UpdatePasswordForShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		ShopService shopService = new ShopService();
		try {
			shopService.updateShopPassword(email,password);
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
		    RequestDispatcher dispatcher = request.getRequestDispatcher("/username.jsp");
		    dispatcher.forward(request, response);
			
		}
	}

}

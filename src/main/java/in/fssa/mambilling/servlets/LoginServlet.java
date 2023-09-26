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
import in.fssa.mambilling.util.Logger;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		ShopService shopService = new ShopService();
		try {
			boolean status = shopService.getShopForLogin(email,password);
			
			if(!status) {
				throw new ServiceException("Invalid Credentials");
			}

			response.sendRedirect(request.getContextPath()+"/getrecentbills");
		} catch (Exception e) {
			Logger.error(e);
			request.setAttribute("errorMessage", e.getMessage());
		    RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
		    dispatcher.forward(request, response);
			
		}

	}

}

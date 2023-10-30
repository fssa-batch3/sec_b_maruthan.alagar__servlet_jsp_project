package in.fssa.mambilling.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.mambilling.exception.ServiceException;
import in.fssa.mambilling.exception.ValidationException;
import in.fssa.mambilling.model.User;
import in.fssa.mambilling.service.UserService;
import in.fssa.mambilling.util.Logger;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/user/edit")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		PrintWriter out = response.getWriter();

		String id = request.getParameter("UserId");

		if (id == null) {
			out.print("Id is mandatory");
			return;
		} else if (id == "") {
			out.print("Id cannot be empty");
			return;
		} else {
			int userId = Integer.parseInt(id);


			try {
				User user = userService.getByUserId(userId);
				request.setAttribute("userDetail", user);
				request.setAttribute("userPhone", user.getPhoneNumber());
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/update_user.jsp");
				dispatcher.forward(request, response);

			} catch (Exception e) {
				Logger.error(e);
				response.sendRedirect(request.getContextPath() + "/Error.jsp");

			}
			
			
			
			
		}
	}

}

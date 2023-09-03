package in.fssa.mambilling.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.mambilling.dto.ProductDTO;
import in.fssa.mambilling.exception.ServiceException;
import in.fssa.mambilling.exception.ValidationException;
import in.fssa.mambilling.model.User;
import in.fssa.mambilling.service.ProductService;
import in.fssa.mambilling.service.UserService;

/**
 * Servlet implementation class ListUserDetails
 */
@WebServlet("/users/detail")
public class ListUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
				request.setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view_user.jsp");
				dispatcher.forward(request, response);
			} catch (ValidationException e) {
				e.printStackTrace();
				out.print(e.getMessage());

			} catch (ServiceException e) {
				e.printStackTrace();
				out.print(e.getMessage());
			}
		}
	}

}

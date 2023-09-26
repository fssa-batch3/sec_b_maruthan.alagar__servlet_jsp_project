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
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/user/update")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String customer_name = request.getParameter("customer_name");
		String phone_number = request.getParameter("phone_number");
		String email = request.getParameter("email");
		String address = request.getParameter("address");

		long old_phone_number = Long.parseLong(request.getParameter("userPhone"));
		long phone = Long.parseLong(phone_number);

		if (email.trim().equals("-") || email.trim().equals("")) {
			email = null;
		}

		if (address.trim().equals("-") || address.trim().equals("")) {
			address = null;
		}

		User newUser = new User(customer_name, email, phone, address);

		UserService us = new UserService();
		User user = null;
		try {
			user = us.getByPhoneNumber(old_phone_number);
			us.updateUser(old_phone_number, newUser);
			response.sendRedirect(request.getContextPath() + "/users");
		} catch (Exception e) {
			Logger.error(e);
			request.setAttribute("userDetail", user);
			request.setAttribute("userPhone", user.getPhoneNumber());
			request.setAttribute("errorMessage", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_user.jsp");
			dispatcher.forward(request, response);
			out.println(e.getMessage());
		}
	}
}

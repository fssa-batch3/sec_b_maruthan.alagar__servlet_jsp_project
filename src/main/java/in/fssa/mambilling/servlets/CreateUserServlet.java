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
import in.fssa.mambilling.model.Price;
import in.fssa.mambilling.model.Product;
import in.fssa.mambilling.model.Product.QuantityType;
import in.fssa.mambilling.model.User;
import in.fssa.mambilling.service.ProductService;
import in.fssa.mambilling.service.UserService;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/users/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String customer_name = request.getParameter("customer_name");
		String phone_number = request.getParameter("phone_number");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		if(email.trim().equals("-")||email.trim().equals("")) {
			email=null;
		}
		
		if(address.trim().equals("-")||address.trim().equals("")) {
			address=null;
		}


		long phone = Long.parseLong(phone_number);

		User newUser = new User(customer_name,email,phone,address);


		UserService us = new UserService();
		try {
			us.createUser(newUser);
			response.sendRedirect(request.getContextPath()+"/users");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
		    RequestDispatcher dispatcher = request.getRequestDispatcher("/add_user.jsp");
		    dispatcher.forward(request, response);
			out.println(e.getMessage());
		}

	}

}

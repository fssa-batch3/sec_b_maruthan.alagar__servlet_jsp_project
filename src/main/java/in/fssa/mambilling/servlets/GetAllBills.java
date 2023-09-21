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
import in.fssa.mambilling.model.Bill;
import in.fssa.mambilling.service.BillService;

/**
 * Servlet implementation class GetAllBills
 */
@WebServlet("/bills")
public class GetAllBills extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		BillService billService = new BillService();
		try {
			List<Bill> bills = billService.getAllBills();
			request.setAttribute("billList", bills);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/bill_list.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/Error.jsp");
		}

	}

}

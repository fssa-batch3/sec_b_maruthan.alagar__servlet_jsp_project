package in.fssa.mambilling.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.mambilling.service.BillService;

/**
 * Servlet implementation class DeleteBillServlet
 */
@WebServlet("/bill/delete")
public class DeleteBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGET(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int billId = Integer.parseInt(request.getParameter("billId"));

			BillService billService = new BillService();

			billService.deleteBill(billId);

			response.sendRedirect(request.getContextPath() + "/getrecentbills");

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
	}

}

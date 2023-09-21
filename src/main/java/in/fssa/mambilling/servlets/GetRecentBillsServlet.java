package in.fssa.mambilling.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.mambilling.exception.ServiceException;
import in.fssa.mambilling.exception.ValidationException;
import in.fssa.mambilling.model.Bill;
import in.fssa.mambilling.model.BillItems;
import in.fssa.mambilling.model.RecentBillModal;
import in.fssa.mambilling.model.User;
import in.fssa.mambilling.service.BillItemsService;
import in.fssa.mambilling.service.BillService;
import in.fssa.mambilling.service.UserService;

/**
 * Servlet implementation class GetRecentBillsServlet
 */
@WebServlet("/getrecentbills")
public class GetRecentBillsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BillService bs = new BillService();
		BillItemsService billItemsService = new BillItemsService();
		List<Bill> recentBills = new ArrayList<Bill>();
		UserService us = new UserService();
		List<RecentBillModal> bills = new ArrayList<RecentBillModal>();
		try {

			recentBills = bs.getAllRecentbills();

			for (Bill bill : recentBills) {
				RecentBillModal modal = new RecentBillModal();
				List<BillItems> recentItems = billItemsService.findByBillId(bill.getBillId());
				int count = 0;

				for (BillItems item : recentItems) {
					count++;
				}
				modal.setProductCount(count);
				modal.setBillId(bill.getBillId());
				modal.setTime(bill.getTimeStamp());

				User newUser = us.getByUserId(bill.getUserId());
				modal.setUserName(newUser.getName());
				bills.add(modal);

			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/Error.jsp");
		}
		request.setAttribute("bills", bills);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}
}

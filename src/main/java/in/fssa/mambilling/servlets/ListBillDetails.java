package in.fssa.mambilling.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.mambilling.dto.ProductDTO;
import in.fssa.mambilling.exception.ServiceException;
import in.fssa.mambilling.exception.ValidationException;
import in.fssa.mambilling.model.Bill;
import in.fssa.mambilling.model.BillItems;
import in.fssa.mambilling.model.User;
import in.fssa.mambilling.service.BillItemsService;
import in.fssa.mambilling.service.BillService;
import in.fssa.mambilling.service.ProductService;
import in.fssa.mambilling.service.UserService;

/**
 * Servlet implementation class ListBillDetails
 */
@WebServlet("/bill/detail")
public class ListBillDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BillItemsService billItemsService = new BillItemsService();
		BillService billService = new BillService();
		UserService us = new UserService();
		ProductService ps = new ProductService();
		PrintWriter out = response.getWriter();

		String id = request.getParameter("BillId");
		String userId = request.getParameter("UserId");
		String time = request.getParameter("time");

		if (id == null || userId == null || time == null) {
			out.print("Details are mandatory");
			return;
		} else if (id.equals("") || userId.equals("") || time.equals("")) {
			out.print("Details cannot be empty");
			return;
		} else {
			int billId = Integer.parseInt(id);
			int billuserId = Integer.parseInt(userId);
			LocalDateTime localDateTime = LocalDateTime.parse(time);

			Bill newBill = new Bill(localDateTime, billId, billuserId);

			List<ProductDTO> products = null;

			try {
				List<BillItems> billItems = billItemsService.findByBillId(billId);

				for (BillItems item : billItems) {
					ProductDTO product = ps.getProductDetail(item.getProductId());
					product.setTotalQuantity(item.getQuantity());

					products = new ArrayList<ProductDTO>();
					products.add(product);

				}

				User newUser = us.getByUserId(billuserId);
				request.setAttribute("billItems", billItems);
				request.setAttribute("products", products);
				request.setAttribute("bill", newBill);
				request.setAttribute("user", newUser);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/view_bill.jsp");
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

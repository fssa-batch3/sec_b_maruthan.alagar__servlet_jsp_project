package in.fssa.mambilling.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import in.fssa.mambilling.exception.ServiceException;
import in.fssa.mambilling.exception.ValidationException;
import in.fssa.mambilling.model.BillItems;
import in.fssa.mambilling.model.BillModal;
import in.fssa.mambilling.model.Price;
import in.fssa.mambilling.model.Product;
import in.fssa.mambilling.model.Product.QuantityType;
import in.fssa.mambilling.service.BillService;
import in.fssa.mambilling.service.PriceService;
import in.fssa.mambilling.service.ProductService;

/**
 * Servlet implementation class CreateBillServlet
 */
@WebServlet("/bills/create")
public class CreateBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		PriceService ps = new PriceService();
		BillService bs = new BillService();
		String product_ids_and_quantities = request.getParameter("product_ids_and_quantities");
		String id = request.getParameter("customer_id");

		int user_id = Integer.parseInt(id);

		Gson gson = new Gson();

		List<BillModal> productList = Arrays.asList(gson.fromJson(product_ids_and_quantities, BillModal[].class));

		List<BillItems> billItems = new ArrayList<BillItems>();

		for (BillModal product : productList) {

			BillItems newItem = new BillItems();
			int priceid = -1;
			try {

				priceid = ps.getByProductId(product.getProductID()).getId();

			} catch (ValidationException e) {
				e.printStackTrace();
			} catch (ServiceException e) {
				e.printStackTrace();
			}
			newItem.setProductId(product.getProductID());
			newItem.setPriceId(priceid);
			newItem.setQuantity(product.getQuantity());

			billItems.add(newItem);
		}

		try {
			bs.createBill(user_id, billItems);
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/bills");

	}
}

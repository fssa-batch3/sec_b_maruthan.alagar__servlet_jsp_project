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

import in.fssa.mambilling.dto.ProductDTO;
import in.fssa.mambilling.exception.ServiceException;
import in.fssa.mambilling.exception.ValidationException;
import in.fssa.mambilling.model.Product;
import in.fssa.mambilling.service.ProductService;

/**
 * Servlet implementation class NewBill
 */
@WebServlet("/bills/new")
public class NewBill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService ps = new ProductService();
		List<ProductDTO> final_products = new ArrayList<ProductDTO>();

		try {
			List<Product> products = ps.getAllProducts();
			for (Product item : products) {
				ProductDTO newProduct = ps.getProductDetail(item.getId());
				final_products.add(newProduct);

			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/Error.jsp");
		} 

		request.setAttribute("products", final_products);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/add_bill.jsp");
		dispatcher.forward(request, response);
	}

}

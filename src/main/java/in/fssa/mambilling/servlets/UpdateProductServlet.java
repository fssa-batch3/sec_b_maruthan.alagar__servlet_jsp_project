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
import in.fssa.mambilling.model.Price;
import in.fssa.mambilling.model.Product;
import in.fssa.mambilling.model.Product.QuantityType;
import in.fssa.mambilling.service.ProductService;
import in.fssa.mambilling.util.Logger;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/product/update")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String product_name = request.getParameter("product_name");
		String quantity = request.getParameter("quantity");
		String type = request.getParameter("type");
		String mrp = request.getParameter("mrp");
		String tax = request.getParameter("tax");
		String discount = request.getParameter("discount");
		String special_name = request.getParameter("special_name");
		String id = request.getParameter("product_id");

		if (special_name.trim().equals("-") || special_name.trim().equals("")) {
			special_name = null;
		}
		int productId = Integer.parseInt(id);
		int pro_quan = Integer.parseInt(quantity);
		double pro_mrp = Double.parseDouble(mrp);
		double pro_tax = Double.parseDouble(tax);
		double pro_discount = Double.parseDouble(discount);

		Price price = new Price(pro_mrp, pro_tax, pro_discount);
		Product newProduct = new Product(product_name, pro_quan, QuantityType.valueOf(type), special_name, price);

		ProductService ps = new ProductService();
		ProductDTO product =null;
		try {
			 product = ps.getProductDetail(productId);
			ps.updateProduct(newProduct, productId);
			response.sendRedirect(request.getContextPath() + "/products");
		} catch (Exception e) {
			Logger.error(e);
			request.setAttribute("productDetail", product);
			request.setAttribute("id",id);
			request.setAttribute("errorMessage", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_product.jsp");
			dispatcher.forward(request, response);
			out.println(e.getMessage());
		}

	}

}

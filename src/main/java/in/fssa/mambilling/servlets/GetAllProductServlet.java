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
import in.fssa.mambilling.model.Product;
import in.fssa.mambilling.service.ProductService;

/**
 * Servlet implementation class ProductCreationServlet
 */
@WebServlet("/products")
public class GetAllProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		ProductService productService = new ProductService();
		try {
			List<Product> products = productService.getAllProducts();
			request.setAttribute("productList", products);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/product_list.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/Error.jsp");
			
		}

	}

}

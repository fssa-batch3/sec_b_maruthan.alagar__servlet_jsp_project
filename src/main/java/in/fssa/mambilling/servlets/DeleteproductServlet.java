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
import in.fssa.mambilling.service.ProductService;
import in.fssa.mambilling.util.Logger;

/**
 * Servlet implementation class DeleteproductServlet
 */
@WebServlet("/product/delete")
public class DeleteproductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService productService = new ProductService();
		PrintWriter out = response.getWriter();

		String id = request.getParameter("productId");

		if (id == null) {
			out.print("Id is mandatory");
			return;
		} else if (id == "") {
			out.print("Id cannot be empty");
			return;
		} else {
			int proId = Integer.parseInt(id);

			try {
				productService.deleteProduct(proId);
				out.print("Product Succesfully Deleted :)");
				response.sendRedirect(request.getContextPath()+"/products");
				
			} catch (Exception e) {
				response.sendRedirect(request.getContextPath() + "/Error.jsp");
				Logger.error(e);
				

			}
			
			
			
			
		}
	}


}

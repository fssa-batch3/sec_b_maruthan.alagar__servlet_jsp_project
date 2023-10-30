package in.fssa.mambilling.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.mambilling.model.Shop;
import in.fssa.mambilling.service.ShopService;
import in.fssa.mambilling.util.Logger;

/**
 * Servlet implementation class EditShopServlet
 */
@WebServlet("/shop/edit")
public class EditShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String id = request.getParameter("shopId");

		if (id == null) {
			out.print("Id is mandatory");
			return;
		} else if (id == "") {
			out.print("Id cannot be empty");
			return;
		} else {
			int shopId = Integer.parseInt(id);

			try {

				ShopService ss = new ShopService();
				Shop newShop = ss.getByShopId(shopId);
				request.setAttribute("shopDetail", newShop);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/viewprofile.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				Logger.error(e);
				response.sendRedirect(request.getContextPath() + "/Error.jsp");

			}

		}
	}

}

package in.fssa.mambilling.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.mambilling.model.Shop;
import in.fssa.mambilling.service.ShopService;

/**
 * Servlet implementation class UpdateShopServlet
 */
@WebServlet("/shop/update")
public class UpdateShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String shopName = request.getParameter("shop_name");
		String licenseNumber = request.getParameter("license_number");
		String phoneNumber = request.getParameter("phone_number");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gstnNumber = request.getParameter("gstn_number");
		String address = request.getParameter("address");
		String ownerName = request.getParameter("owner_name");
		String printName = request.getParameter("print_name");
		long phone = Long.parseLong(phoneNumber);


		Shop newShop = new Shop();
		Shop shop = new Shop();
		newShop.setAddress(address);
		newShop.setEmail(email);
		newShop.setGSTNNumber(gstnNumber);
		newShop.setLicenseNumber(licenseNumber);
		newShop.setOwnerName(ownerName);
		newShop.setPassword(password);
		newShop.setPhoneNumber(phone);
		newShop.setPrintName(printName);
		newShop.setShopName(shopName);

		ShopService shopService = new ShopService();
		try {
			shopService.updateShop(newShop);
			response.sendRedirect(request.getContextPath() + "/getrecentbills");
			shop = shopService.getByShopId(1);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.setAttribute("shopDetail", shop);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/viewprofile.jsp");
			dispatcher.forward(request, response);

		}

	}

}

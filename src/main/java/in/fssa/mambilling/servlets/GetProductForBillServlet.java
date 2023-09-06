package in.fssa.mambilling.servlets;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import in.fssa.mambilling.dto.ProductDTO;
import in.fssa.mambilling.exception.ServiceException;
import in.fssa.mambilling.exception.ValidationException;
import in.fssa.mambilling.model.ResponseEntity;
import in.fssa.mambilling.service.ProductService;

/**
 * Servlet implementation class GetProductForBillServlet
 */
@WebServlet("/getproduct")
public class GetProductForBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService ps = new ProductService();
		ProductDTO product = new ProductDTO();

		BufferedReader reader = request.getReader();
        StringBuilder requestBody = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            requestBody.append(line);
        }

        // Parse the JSON data using Gson
        Gson gson = new Gson();
        JsonObject requestData = JsonParser.parseString(requestBody.toString()).getAsJsonObject();
        
        // Extract the phone number from the JSON data
        String productId = requestData.get("product_id").getAsString();

		int id = Integer.parseInt(productId);

		try {

			product = ps.getProductDetail(id);

		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ResponseEntity responseEntity = new ResponseEntity(200, product, "Product Retrieved Successfully :)");

		
		String reponseJson = gson.toJson(responseEntity);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(reponseJson);
	}
}

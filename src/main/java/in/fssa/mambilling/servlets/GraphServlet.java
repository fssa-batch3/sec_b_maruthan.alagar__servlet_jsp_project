package in.fssa.mambilling.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

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
import in.fssa.mambilling.service.BillService;
import in.fssa.mambilling.service.ProductService;

/**
 * Servlet implementation class GraphServlet
 */
@WebServlet("/getAmountDetails")
public class GraphServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BillService bs = new BillService();


Map<String, Double> details = null;
        // Parse the JSON data using Gson
        Gson gson = new Gson();
      


		try {
			details = bs.getGraphDetails();

		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String jsonData = new Gson().toJson(details);
		ResponseEntity responseEntity = new ResponseEntity(200, jsonData, "Details Retrieved Successfully :)");

		
		String reponseJson = gson.toJson(responseEntity);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(reponseJson);
	}

}

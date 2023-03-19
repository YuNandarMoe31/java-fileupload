package com.jdc.upload;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/download")
public class FileDownload extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var products = """
				[
					{"Name":"Coke", "Price":600},
					{"Name":"Pepsi", "Price":500},
					{"Name":"Royal D", "Price":700},
					{"Name":"Nest Cafe", "Price":800},
					{"Name":"Red Bull", "Price":1000},
				]
				""";
		resp.setHeader("Content-Type", "application/json");
		resp.setHeader("Content-Disposition", "attachment; filename=\"product.json\"");
		resp.getWriter().append(products);
	}
}

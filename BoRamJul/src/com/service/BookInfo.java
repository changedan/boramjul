package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.TBookDAO;
import com.vo.TBookDTO;


@WebServlet("/BookInfo")
public class BookInfo extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int book_seq = Integer.parseInt(request.getParameter("no"));
		
		TBookDAO dao = new TBookDAO();
		
		TBookDTO book = dao.selectBookInfo(book_seq);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("bookinfo.jsp");
		request.setAttribute("book", book);
		dispatcher.forward(request, response);
		
	}

}

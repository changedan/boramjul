package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.DAO.ReviewDAO;
import com.DAO.memberDAO;
import com.DTO.memberDTO;
import com.vo.TBookDTO;

@WebServlet("/ReviewCon")
public class ReviewCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		memberDTO dto = (memberDTO)session.getAttribute("dto");
		String book_title = request.getParameter("book_title");
		String mb_nick = dto.getMbNick(); 
		String review_content = request.getParameter("review_content");
		Double star_point = Double.parseDouble(request.getParameter("starpoint"));
		String tag1 = request.getParameter("tag1");
		String tag2 = request.getParameter("tag2");
		String tag3 = request.getParameter("tag3");
		
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.Review(book_title, mb_nick, review_content, star_point, tag1, tag2, tag3);
		
		if (cnt > 0) {
			response.sendRedirect("main.jsp"); 
		} else {

		}
		System.out.println(book_title);
		System.out.println(mb_nick);
		System.out.println(review_content);
		System.out.println(star_point);
		System.out.println(tag1);
		System.out.println(tag2);
		System.out.println(tag3);
	
	}

}

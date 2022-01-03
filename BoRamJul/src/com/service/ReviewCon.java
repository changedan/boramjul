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
		TBookDTO book = (TBookDTO)request.getAttribute("book"); // 책제목 불러오는 방법1
		// String book_title = request.getParameter("book_title"); // 책제목 불러오는 방법2 (ajax)
		String book_title = book.getBookTitle();
		String mb_id = dto.getMbId(); 
		String review_content = request.getParameter("review_content");
		Double star_point = Double.parseDouble(request.getParameter("starpoint"));
		String tag1 = request.getParameter("tag1");
		String tag2 = request.getParameter("tag2");
		String tag3 = request.getParameter("tag3");
		
		ReviewDAO dao = new ReviewDAO(book_title, mb_id, review_content, star_point, tag1, tag2, tag3);
		
		System.out.println(book_title);
		System.out.println(mb_id);
		System.out.println(review_content);
		System.out.println(star_point);
		System.out.println(tag1);
		System.out.println(tag2);
		System.out.println(tag3);
	
	}

}

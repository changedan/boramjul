package com.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReviewCon")
public class ReviewCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String review_content = request.getParameter("review_content");
		String star_point = request.getParameter("starpoint");
		String tag1 = request.getParameter("tag1");
		String tag2 = request.getParameter("tag2");
		String tag3 = request.getParameter("tag3");
		
		
		
		
		System.out.println(review_content); // 잘받음
		System.out.println(star_point); // 별의 value값을 받아야되는데 on이라고 받음
		System.out.println(tag1); // 태그를 여러개 받아야하는데 한개만 받음
		System.out.println(tag2); // 태그를 여러개 받아야하는데 한개만 받음
		System.out.println(tag3); // 태그를 여러개 받아야하는데 한개만 받음
	
	
	}

}

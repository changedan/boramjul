<%@page import="com.vo.TBookDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	TBookDTO book = (TBookDTO) request.getAttribute("book");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .comment ul li{
            list-style: none;
            border: 1px dotted black;
        }
    </style>
</head>
<body>
    <!-- <div>상단바</div> -->
    <hr>
    <div class="book_img"
        style="display: inline-block;
               width: 500px; height: 750px;
               margin-left: 70px; border-right: 1px solid gray;
               align-content: center;">
        <h2 style="width: 300px; text-align: center;"><%=book.getBookTitle() %></h2>
        <img src="<%=book.getBookCover() %>" style="width: 420px; height: 560px;">
    </div>
    <div class="book_info" style="display: inline-block;">
        <button onclick="" style="font-size: 15px; align-content: center;
                                  position: absolute;
                                  right: 20%;
                                  width: 100px; height: 30px; background-color: rgb(127, 226, 27);">책평가하기</button>
        <br>
        <br>
        <br>
        <ul style="font-size: 20px; list-style: none;">
            <li>저자 <%=book.getBookAuthor()%> </li>
            <li>출판사</li>
            <li>출간일</li>
            <li>목차</li>
            <li>개요</li>
        </ul>
        <hr>
        <div class="my_comment">
            <h2 style="text-align: center;">당신의 평가</h2>
            <h1 style="text-align: center;">
                ★★★★★
            </h1>
            <hr>
            <div class="comment" style="display: inline-block;">
                <ul>
                    <li>저자</li>
                    <li>출판사</li>
                    <li>출간일</li>
                    <li>목차</li>
                    <li>개요</li>
                </ul>
            </div>
            <div class="comment" style="display: inline-block;">
                <ul>
                    <li>저자</li>
                    <li>출판사</li>
                    <li>출간일</li>
                    <li>목차</li>
                    <li>개요</li>
                </ul>
            </div>
        </div>
        <div class="social" style="display: inline-block">
			<h3>블로그</h3>
				<div id="blog_search">
				
				</div>
        	<h3>뉴스</h3>
        		<div id="news_search">
        		
        		</div>
        </div>
        
    </div>
    <hr>
    
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
    	$(function(){
    		$.ajax({
    			url:'http://172.30.1.51:5021/',
    			dataType:'json',
    			data:{
    				title:`<%=book.getBookTitle() %>`,
    				author:`<%=book.getBookTitle() %>`
    			},
    			success:function(result){
    				console.log(result);
    				
    				let content = '';
    				
 					for(let i=0; i<result.length; i++){
 						content += '<p><a href="'+blog_result[i].link+'">'+blog_result[i].title+'</a></p>';
 					}	
    				
    				$('#blog_search').html(content);
    			}
    		});
    	});
    	$(function(){
    		$.ajax({
    			url:'http://172.30.1.51:5021/',
    			dataType:'json',
    			data:{
    				title:`<%=book.getBookTitle() %>`,
    				author:`<%=book.getBookTitle() %>`
    			},
    			success:function(result){
    				console.log(result);
    				
    				let content = '';
    				
 					for(let i=0; i<result.length; i++){
 						content += '<p><a href="'+news_result[i].link+'">'+news_result[i].title+'</a></p>';
 					}	
    				
    				$('#news_search').html(content);
    			}
    		});
    	});
    </script>
</body>
</html>
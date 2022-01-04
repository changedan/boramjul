<%@page import="com.DTO.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.ReviewDAO"%>
<%@page import="com.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.vo.TBookDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%
	TBookDTO book = (TBookDTO)request.getAttribute("book");
	memberDTO dto = (memberDTO)session.getAttribute("dto"); 
	ReviewDAO dao = new ReviewDAO();
	ArrayList<ReviewDTO> review = dao.selectReview();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보람줄-북작북작</title>
    <link rel="stylesheet" href="style.css">
    <style>
        hr {
            margin-top: 8px;
            margin-bottom: 8px;
        }
		book_main{
			width: 80%;
			text-align: left;
		}
        .comment ul li {
            font-size: 18px;
            list-style: none;
            margin: 3px;
            overflow: hidden;
            padding: 2px;
        }

        .tab_btn {
            font-size: 20px;
            display: inline;
            width: 120px;
            height: 35px;
            text-align: center;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 1px;
            padding: 1px;
        }

        .book_info ul li {
            padding: 2px;
        }

        .book_tag li {
            margin-right: 10px;
            padding: 3px;
            font-weight: bold;
            border: 0.5px solid black;
            border-radius: 10px;
        }

        .comment ul {
            margin-left: 0px;
            margin-bottom: 0px;
        }

        .starpoint_wrap {
            display: inline-block;
        }

        .starpoint_box {
            position: relative;
            background:
                url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0 0 no-repeat;
            font-size: 0;
        }

        .starpoint_box .starpoint_bg {
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            height: 18px;
            background:
                url(https://hsecode.github.io/images_codepen/codepen_sp_star.png) 0 -20px no-repeat;
            pointer-events: none;
        }

        .starpoint_box .label_star {
            display: inline-block;
            width: 10px;
            height: 18px;
            box-sizing: border-box;
        }

        .starpoint_box .star_radio {
            opacity: 0;
            width: 0;
            height: 0;
            position: absolute;
        }

        .starpoint_box .star_radio:nth-of-type(1):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(1):checked~.starpoint_bg {
            width: 10%;
        }

        .starpoint_box .star_radio:nth-of-type(2):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(2):checked~.starpoint_bg {
            width: 20%;
        }

        .starpoint_box .star_radio:nth-of-type(3):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(3):checked~.starpoint_bg {
            width: 30%;
        }

        .starpoint_box .star_radio:nth-of-type(4):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(4):checked~.starpoint_bg {
            width: 40%;
        }

        .starpoint_box .star_radio:nth-of-type(5):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(5):checked~.starpoint_bg {
            width: 50%;
        }

        .starpoint_box .star_radio:nth-of-type(6):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(6):checked~.starpoint_bg {
            width: 60%;
        }

        .starpoint_box .star_radio:nth-of-type(7):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(7):checked~.starpoint_bg {
            width: 70%;
        }

        .starpoint_box .star_radio:nth-of-type(8):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(8):checked~.starpoint_bg {
            width: 80%;
        }

        .starpoint_box .star_radio:nth-of-type(9):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(9):checked~.starpoint_bg {
            width: 90%;
        }

        .starpoint_box .star_radio:nth-of-type(10):hover~.starpoint_bg,
        .starpoint_box .star_radio:nth-of-type(10):checked~.starpoint_bg {
            width: 100%;
        }

        .blind {
            position: absolute;
            clip: rect(0, 0, 0, 0);
            margin: -1px;
            width: 1px;
            height: 1px;
            overflow: hidden;
        }

        #blog,
        #news {
            margin-left: 30px;
            width: 1400px;
            text-align: left;
        }

        .info_tab {
            height: 110px;
            margin: 2px;
            padding: 0px;
            display: flex;
        }

        .info_tab img {
            width: 100px;
            height: 100px;
            padding: 5px;
        }

        .info_tab_bl {
            display: inline-block;
            margin-top: 0px;
        }

        .info_tab_bl ul {
            list-style: none;
            padding-left: 10px;
            margin-top: 0px;
            margin-bottom: 0px;
            overflow: hidden;
        }
        

        #halfcount {
        position: absolute;
		
        color: ghostwhite;
        }
        .halfcount::before {
        position: absolute;

        content: attr(data-split);
        width: 50%;
        color: green;
        overflow: hidden;
        }
        .counted{
        color: green;
        }
        .uncounted{
        color: #fff;
        }
        
        </style>
</head>

<body class="site-main" id="sTop">
    <!-- /.site-header -->
    <div class="site-header" style="display: block; margin-left: 300px;">
        <div class="container">
            <nav id="nav_header">
                <div id="nav_title">
                    <a href="main.jsp">북작북작</a>
                </div>
                <div id="nav_login">
                    <%if (dto == null){%>
                    <a href="#" onclick="openlogin()" style="font-size: 20px; font-weight: bold;">로그인&nbsp;&nbsp;&nbsp;</a>
                    <a href="#" onclick="openjoin()" style="font-size: 20px; font-weight: bold;">회원가입</a>
                    <%}else {%>
                    <a href="LogoutCon" style="font-size: 20px; font-weight: bold;">로그아웃&nbsp;&nbsp;&nbsp;</a>
                    <a href="#" onclick="openinfo()" style="font-size: 20px; font-weight: bold;">회원정보[닉네임:<%=dto.getMbNick()%>]</a>
                    <%} %>
                </div>
            </nav>
        </div>
        <div class="main-header">
            <div class="container">
                <div id="menu-wrapper">
                    <ul class="menu-first">
                        <li><a href="booklist.jsp">베스트셀러</a></li>
                        <li><a href="newlist.jsp">신간도서</a></li>
                        <li><a href="steadylist.jsp">스테디셀러</a>
                        <li><a href="list.jsp">자유게시판</a></li>
                    </ul>
                    <!-- /.main-menu -->
                </div>
                <!-- /#menu-wrapper -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /.main-header -->
    </div>
    <hr class="hr_main" style="width:80%;">
	<center>
    <div class="book_main">
        <!--도서 이미지-->
        <div class="book_img" style="display: inline-block; width: 420px; height: 700px; margin-right: 40px; margin-top: 0px; margin-bottom: 5px; align-content: center; padding-top: 0px;">
            <br> <br>
            <h2 style="margin-right: 0px; margin-top: 0px; margin-bottom: 35px; width: 420px; text-align: center; font-size: 40px;"><%=book.getBookTitle()%></h2>
            <img src="<%=book.getBookCover() %>" style="width: 420px; height: 560px;">
        </div>
        <!--책 정보-->
        <div class="book_info" style="width: 800px; max-height:1000px; display: inline-block; border-left: 1px solid gray; margin-bottom: 5px; text-align: left;">
			<%if (dto==null) {%>
			<%}else if(dto!=null){%>
            <button onclick="reviewOn()" style="font-size: 18px; align-content: center; position: relative; padding: 5px; left: 650px; width: 120px; height: 35px; background-color: rgb(127, 226, 27); color: white; cursor: pointer;">
                <b>책평가하기</b>
            </button>
            <%}%>
            <ul style="font-size: 18px; list-style: none; margin-left: 40px; margin-bottom: 0px; padding: 1px;">
                <li>저자 : <%=book.getBookAuthor()%></li>
                <br>
                <li>출판사 : <%=book.getBookPublisher()%></li>
                <br>
                <li>출간일 : <%=book.getBookDate()%></li>
                <br>
                <li>목차 : 
                	<p style="overflow:auto; margin-top:10px; margin-bottom:10px; width: 750px; height:72px; line-height: 30px;"><%=book.getBookContent()%></p>
                </li>
                <br>
                <li>개요 : </li>
                <li>
                    <p style="overflow:auto; margin-top:10px; margin-bottom:10px; width: 750px; height:72px; line-height: 30px;"><%=book.getBookBrief()%></p>
                </li>
            </ul>

            <!--도서 해쉬태그-->
            <br>
	            <ul class=book_tag style="list-style: none; margin-left: 40px; margin-bottom: 20px; padding-left: 0px; display: inline-flex;">
	            <% for (int i = 0; i<review.size(); i++){ %>
	            <%if (review.get(i).getBook_title().equals(book.getBookTitle())){ %>
	                <li><%=review.get(i).getReview_tag1()%></li>
	                <li><%=review.get(i).getReview_tag2()%></li>
	                <li><%=review.get(i).getReview_tag3()%></li>
	            <%} }%>
	            </ul>
            <hr>
            <!--도서평가-->
            <div class="my_comment">
                <h2 style="text-align: center; margin-top: 10px; margin-bottom: 2px; font-size: 25px;">도서리뷰</h2>
                <hr>
                <div class="comment" style="display: inline-block; width: 350px; border-right: 1px solid gray; margin-top: 10px; margin-left: 38px; padding-right: 40px;">
                    <ul>
						<% for (int i = 0; i<review.size(); i++){ %>
	                        <li>
	                        	<%if (review.get(i).getBook_title().equals(book.getBookTitle())){ %>
						            <%=review.get(i).getMb_nick()%><br>
									<p style="height:20px; overflow:hidden; margin-top: 0px; margin-bottom: 0px;"><%=review.get(i).getReview_content()%></p>
						            <%=review.get(i).getStar_point() %>
						            <% double star = review.get(i).getStar_point();
						            		if(star < 1 ){ %>
						            			<span data-split='★'  id='halfcount' class="halfcount">★</span>
						            		<%}else{
						            			for( int k = 1; k <= 5; k++){
													if(star > 0.9){%>
														<span class='counted'>★</span>
													<%}else if(0.1 >= star){%>
														<span class='uncounted'>★</span>
													<%}else{%>
														<span data-split='★' id='halfcount' class="halfcount">★</span>
						            				<%}
						            				System.out.println(star);
						            				star --;
						            				%>
						            		<%}%>
						            	<%}%>
						            		
	                        </li>
                        <%}}%>
                    </ul>
                </div>
                <div class="comment" style="display: inline-block; width: 350px; margin-left: 15px; margin-top: 10px; border-left: 1px solid gray; padding-right: 40px;">
                    <ul>
				 		 <% for (int i = 4; i<review.size(); i++){ %>
	                        <li>
	                        	<%if (review.get(i).getBook_title().equals(book.getBookTitle())){ %>
						            <%=review.get(i).getMb_nick()%><br>
									<p style="height:20px; overflow:hidden; margin-top: 0px; margin-bottom: 0px;"><%=review.get(i).getReview_content()%></p>
						            <%=review.get(i).getStar_point() %>
						            <% double star = review.get(i).getStar_point();
						            		if(star < 1 ){ %>
						            			<span data-split='★'  id='halfcount' class="halfcount">★</span>
						            		<%}else{
						            			for( int k = 1; k <= 5; k++){
													if(star > 0.9){%>
														<span class='counted'>★</span>
													<%}else if(0.1 >= star){%>
														<span class='uncounted'>★</span>
													<%}else{%>
														<span data-split='★' id='halfcount' class="halfcount">★</span>
						            				<%}
						            				System.out.println(star);
						            				star --;
						            				%>
						            		<%}%>
						            	<%}%> 
						            		
	                        </li>
                       <%}}%> 
                    </ul>
                </div>
            </div>

            <!--리뷰창 오버레이-->
            <div id="review_over" style="position: absolute; top: 25%; left: 50%; transform: translateX(-50%); display: none; width: 800px; max-height: 700px; background-color: white; border: 2px solid black;">
                <span class="closebtn" onclick="close_review()" title="닫기" style="position: relative; top: 20px; left: 750px; font-size: 30px; cursor: pointer;">X</span>
                <h2 style="text-align: center; margin-bottom: 0px; font-size: 35px; font-weight: bold;"><%=book.getBookTitle()%></h2>
                <h5 style="text-align: center; margin-top: 0px; font-size: 15px;"><%=book.getBookAuthor()%></h5>
                <form action="ReviewCon" method="post" style="text-align: center;">
                    <hr>
                    <span style="display: inline-block;"> 
                    	<label for="tag" style="font-size: 15px;"><strong>도서 태그</strong> 
                    		<input name="tag1" type="text" placeholder="#재미" style="width: 90px; margin-left: 10px; text-align: center;">
                            <input name="tag2" type="text" placeholder="#스릴" style="width: 90px; margin-left: 10px; text-align: center;">
                            <input name="tag3" type="text" placeholder="#유용한" style="width: 90px; margin-left: 10px; text-align: center;">
                        </label>
                    </span>
                    <hr>
                    <textarea cols="100" rows="15" placeholder="서평을 남겨주세요" maxlength="1000" name="review_content" style="resize: none; border: 1px dotted gray; display: inline-block; margin: 5px;"></textarea>
                    <hr>

                    <div class="starpoint_wrap" style="display: inline-block;">
                        <div class="starpoint_box">
                            <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
                            <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
                            <label for="starpoint_3" class="label_star" title="1.5" ><span class="blind">1.5점</span></label>
                            <label for="starpoint_4" class="label_star" title="2" ><span class="blind">2점</span></label>
                            <label for="starpoint_5" class="label_star" title="2.5" ><span class="blind">2.5점</span></label>
                            <label for="starpoint_6" class="label_star" title="3" ><span class="blind">3점</span></label>
                            <label for="starpoint_7" class="label_star" title="3.5" ><span class="blind">3.5점</span></label>
                            <label for="starpoint_8" class="label_star" title="4" ><span class="blind">4점</span></label>
                            <label for="starpoint_9" class="label_star" title="4.5" ><span class="blind">4.5점</span></label>
                            <label for="starpoint_10" class="label_star" title="5" ><span class="blind">5점</span></label>
                            <input type="radio" name="starpoint" value="0.5" id="starpoint_1" class="star_radio"> 
                            <input type="radio" name="starpoint" value="1" id="starpoint_2" class="star_radio"> 
                            <input type="radio" name="starpoint" value="1.5" id="starpoint_3" class="star_radio"> 
                            <input type="radio" name="starpoint" value="2" id="starpoint_4" class="star_radio"> 
                            <input type="radio" name="starpoint" value="2.5" id="starpoint_5" class="star_radio"> 
                            <input type="radio" name="starpoint" value="3" id="starpoint_6" class="star_radio"> 
                            <input type="radio" name="starpoint" value="3.5" id="starpoint_7" class="star_radio"> 
                            <input type="radio" name="starpoint" value="4" id="starpoint_8" class="star_radio"> 
                            <input type="radio" name="starpoint" value="4.5" id="starpoint_9" class="star_radio"> 
                            <input type="radio" name="starpoint" value="5" id="starpoint_10" class="star_radio">
                            <div class="starpoint_bg"></div>
                        </div>
                    </div>
                    <input style="display: none" type="text" name="book_title" value="<%=book.getBookTitle()%>">
                    <hr>
                    <input type="submit" value="작성완료" style="display: inline-block; position: relative; top: 20px; color: white; margin-bottom: 50px;font-weight: bold; background-color: rgb(78, 221, 78);">
                </form>
            </div>
        </div>
    </div>
	</center>
    <hr>
    <!--블로그 및 뉴스 정보-->
    <center>
    <div style="margin-top: 10px;">
        <button class="tab_btn" onclick="blogOn()" style="margin-right: -3px; color: white; background-color: #19ce60;">블로그</button>
        <button class="tab_btn" onclick="newsOn()" style="margin-left: -3px; color: white; background-color: #3f63bf;">뉴스</button>
        <div id="blog">
            <!-- <div class="info_tab">
				<div class="th_img" style="display: inline-block;">
					<img src="">
				</div>
				<div class="info_tab_bl">
					<ul>
						<li style="margin-top: 5px;">블로그 게시글 제목</li>
						<li>게시글 요약</li>
						<li>블로그명</li>
					</ul>
				</div>
			</div> -->

        </div>
        <div id="news" style="display: none;">
            <!-- <div class="info_tab">
				<div class="th_img" style="display: inline-block;">
					<img src="">
				</div>
				<div class="info_tab_bl">
					<ul>
						<li style="margin-top: 5px;">기사 제목</li>
						<li>기사글 요약</li>
					</ul>
				</div>
			</div> -->

        </div>
    </div>
	</center>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
        function blogOn() {
            document.getElementById("blog").style.display = "block";
            document.getElementById("news").style.display = "none";
        }

        function newsOn() {
            document.getElementById("news").style.display = "block";
            document.getElementById("blog").style.display = "none";
        }

        function reviewOn() {
            document.getElementById("review_over").style.display = "block";
        }

        function close_review() {
            document.getElementById("review_over").style.display = "none";
        }
        $(function() {
            $.ajax({
                url: 'http://172.30.1.51:5021/',
                dataType: 'json',
                data: {
                    title: `<%=book.getBookTitle() %>`,
                    author: `<%=book.getBookTitle() %>`
                },
                success: function(result) {
                    console.log(result);

                    let blog = result.blog;
                    let news = result.news;

                    let blog_content = '';
                    let news_content = '';

                    for (let i = 0; i < blog.length; i++) {
                        blog_content += '<div class="info_tab">'
                        blog_content += '<div class="th_img" style="display: inline-block;"><img src="./images/blog.png"></div>'
                        blog_content += '<div class="info_tab_bl">'
                        blog_content += '<ul><li style="margin-top: 5px;"><a href="' + blog[i].link + '">' + blog[i].title + '</a></li>'
                        blog_content += '<li>' + blog[i].description + '</li>'
                        blog_content += '</ul></div></div>';
                    }

                    for (let i = 0; i < news.length; i++) {
                        news_content += '<div class="info_tab">'
                        news_content += '<div class="th_img" style="display: inline-block;"><img src="./images/nes_2.png"></div>'
                        news_content += '<div class="info_tab_bl">'
                        news_content += '<ul><li style="margin-top: 5px;"><a href="' + news[i].link + '">' + news[i].title + '</a></li>'
                        news_content += '<li>' + news[i].description + '</li>'
                        news_content += '</ul></div></div>';
                    }

                    $('#blog').html(blog_content);
                    $('#news').html(news_content);

                }
            });
        });
    </script>
    <script>

		var book_title = "<%=book.getBookTitle()%>"
		
		function book_title(){
		
		  $.ajax({
		    url: "ReviewCon.java",
		    data: "book_title=" + book_title,
		    type: "POST",
		    success : function(data){
		      alert("성공")
		    },
		    error : function(){
		      alert("에러")		
		    }
		  });
		}
			
	</script>
 
</body>

</html>
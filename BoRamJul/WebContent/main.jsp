<%@page import="com.DTO.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.TBookDAO"%>
<%@page import="com.vo.TBookDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	memberDTO dto = (memberDTO)session.getAttribute("dto"); 
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<!-- 북작북작 css -->
<link rel="stylesheet" href="style.css">
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<title>보람줄 - 북작북작</title>
</head>
<body class="site-main" id="sTop">
	<div class="site-header">
		<div class="container">
			<nav id="nav_header">
				<div id="nav_title">
					<a href="main.jsp">북작북작</a>
				</div>
					<div id="nav_login">
							<%if (dto == null){%>
							<a href="#" onclick="openlogin()" style="font-size: 20px; font-weight: bold;">로그인&nbsp;&nbsp;&nbsp;</a>
							<a href="#" onclick="openjoin()"style="font-size: 20px; font-weight: bold;">회원가입</a>
							<%}else {%>
							<a href ="LogoutCon" style="font-size: 20px; font-weight: bold;">로그아웃&nbsp;&nbsp;&nbsp;</a>
							<a href="#" onclick="openinfo()"style="font-size: 20px; font-weight: bold;">회원정보[닉네임:<%=dto.getMbNick()%>]</a>
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
						<li><a href="#our-team">자유게시판</a></li>
					</ul>
					<!-- /.main-menu -->
				</div>
				<!-- /#menu-wrapper -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.main-header -->
	</div>
	<!-- /.site-header -->
	<hr class="hr_main">
	<!-- 메인화면-->
	<div class="site-slider">
		<div class="slider">
			<div class="flexslider">
				<ul class="slides">
					<%
						TBookDAO dao = new TBookDAO();
					ArrayList<TBookDTO> arr = dao.selectBookAll();
					%>
					<%
						for (int i = 0; i < 8; i++) {
					%>
					<li class="slider-list">
						<a href="BookInfo?no=<%=arr.get(i).getBookSeq()%>">
						<div class="overlay"></div> <img src="<%=arr.get(i).getBookCover()%>" alt="">
						<div class="slider-title"><%=arr.get(i).getBookTitle() %></div>
						<div class="slider-berief"><%=arr.get(i).getBookBrief() %></div>
						<div class="slider-caption visible-md visible-lg"></div>
						</a>
					</li>
					<%
						}
					%>


				</ul>
			</div>
			<!-- /.flexslider -->
		</div>
		<!-- /.slider -->
	</div>
	<!-- /.site-slider -->
	</div>
	<!-- /.site-main -->

	<!--베스트-->
	<div class="content-section" id="Bestseller">
		<div class="container">
			<div class="row">
				<div class="heading-section col-md-12 text-center">
					<h2>
						<span class="best">
							베스트셀러
						</span>
					</h2>
				</div>
				<!-- /.heading-section -->
			</div>
			<!-- /.row -->
			<div class="row">

				<%
					for (int i = 0; i < 8; i++) {
				%>
				<div class="portfolio-item col-md-3 col-sm-6">
					<a href="BookInfo?no=<%=arr.get(i).getBookSeq()%>">
						<div class="portfolio-thumb">
							<img src="<%=arr.get(i).getBookCover()%>" alt="">
							<div class="portfolio-overlay">
								<h3><%=arr.get(i).getBookTitle()%></h3>
								<p><%=arr.get(i).getBookBrief()%></p>
								<a href="images/book/book1.jpg" data-rel="lightbox"
									class="expand"> <i class="fa fa-search"></i>
								</a>
							</div>
							<!-- /.portfolio-overlay -->
						</div> <!-- /.portfolio-thumb -->
					</a>
				</div>
				<!-- /.portfolio-item -->
				<%
					}
				%>
				<!-- /.portfolio-item -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#portfolio -->

	<!--신간도서-->
	<!-- img : 이미지
	p : 책의 정보, 설명
 -->
	<div class="content-section" id="Newbooks">
		<div class="container">
			<div class="row">
				<div class="heading-section col-md-12 text-center">
					<h2>
						<span class="new">
							신간도서
						</span>
					</h2>
				</div>
				<!-- /.heading-section -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb1.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>흔한남매9</h3>
							<p>따끈따끈한 웃음이 담긴 흔한남매의 일상 스토리! 목감기에 걸린 에이미, 추운 날 등교하는 유형, 중2병
								으뜸이와 사춘기 에이미의 살벌한 대결, 왁자지껄 눈썰매장 스토리, 급똥 위기에 처한 으뜸이와 에이미 등 흔한남매와
								함께 웃다 보면 어느새 마음이 따뜻해질 거예요!</p>
							<a href="images/book/nb1.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb2.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>옷소매 붉은끝동</h3>
							<p>MBC 최고 시청률 기록, 드라마 부문 화제성 연속 1위!? 대세 배우 이준호, 이세영 주연의 애절한
								로맨스 사극 『옷소매 붉은 끝동』의 감동을 영원히 간직할 수 있는 포토에세이! 이산과 덕임의 아름다운 사랑이 담긴
								명대사와 스틸 사진, 촬영 현장 비하인드 컷, 스페셜 인터뷰까지 『옷소매 붉은 끝동』의 팬이라면 꼭 소장해야 할
								책!</p>
							<a href="images/book/nb2.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb3.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>불편한 편의점</h3>
							<p>불편한데 자꾸 가고 싶은 편의점이 있다! 힘들게 살아낸 오늘을 위로하는 편의점의 밤 정체불명의 알바로부터
								시작된 웃음과 감동의 나비효과 『망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2</p>
							<a href="images/book/nb3.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb4.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>마법천자문 52</h3>
							<p>시작의 땅에서 육체를 되찾고 부활한 암흑상제! 신의 관문 안으로 들어간 손오공은 그 안에서 두 가지
								선택의 갈림길에 놓이게 된다.</p>
							<a href="images/book/nb4.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb5.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>트렌드 코리아 2022</h3>
							<p>TIGER OR CAT 검은 호랑이처럼 힘차게 포효하는 2022가 되기를 “우리를 죽이지 못하는 것들은
								우리를 더 강하게 만든다.”</p>
							<a href="images/book/nb5jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb6.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>흔한남매 겨울밤 대소동</h3>
							<p>어린이들에게 특별한 선물이 될 『흔한남매 겨울밤 대소동』! 『흔한남매 겨울밤 대소동』은 겨울을 맞은
								어린이들에게 따뜻한 웃음을 안겨 주는 큰 선물이 될 것입니다</p>
							<a href="images/book/nb6.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb7.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>이순신의 바다</h3>
							<p>60만 구독자 1억뷰 조회의 명강의를 책으로 만나다! 수많은 역사서 제안 러브콜에도 이순신만을 고집하며
								써 내려간, "역사를 역사답게" 알리고 싶은 그의 첫 번째 이야기</p>
							<a href="images/book/nb7.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb8.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>미드나잇 라이브러리</h3>
							<p>25만 부 기념 한정판 ‘퍼플에디션’ 출간! 인생의 두 번째 기회에 대한 마법 같은 이야기 아마존,
								[뉴욕타임스], [선데이타임스] 장기 베스트셀러</p>
							<a href="images/book/nb8.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#portfolio -->
	
	<div class="content-section" id="Steadyseller">
		<div class="container">
			<div class="row">
				<div class="heading-section col-md-12 text-center">
					<h2>
						<span class="steady">
							스테디셀러
						</span>
					</h2>
				</div>
				<!-- /.heading-section -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb1.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>흔한남매9</h3>
							<p>따끈따끈한 웃음이 담긴 흔한남매의 일상 스토리! 목감기에 걸린 에이미, 추운 날 등교하는 유형, 중2병
								으뜸이와 사춘기 에이미의 살벌한 대결, 왁자지껄 눈썰매장 스토리, 급똥 위기에 처한 으뜸이와 에이미 등 흔한남매와
								함께 웃다 보면 어느새 마음이 따뜻해질 거예요!</p>
							<a href="images/book/nb1.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb2.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>옷소매 붉은끝동</h3>
							<p>MBC 최고 시청률 기록, 드라마 부문 화제성 연속 1위!? 대세 배우 이준호, 이세영 주연의 애절한
								로맨스 사극 『옷소매 붉은 끝동』의 감동을 영원히 간직할 수 있는 포토에세이! 이산과 덕임의 아름다운 사랑이 담긴
								명대사와 스틸 사진, 촬영 현장 비하인드 컷, 스페셜 인터뷰까지 『옷소매 붉은 끝동』의 팬이라면 꼭 소장해야 할
								책!</p>
							<a href="images/book/nb2.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb3.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>불편한 편의점</h3>
							<p>불편한데 자꾸 가고 싶은 편의점이 있다! 힘들게 살아낸 오늘을 위로하는 편의점의 밤 정체불명의 알바로부터
								시작된 웃음과 감동의 나비효과 『망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2</p>
							<a href="images/book/nb3.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb4.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>마법천자문 52</h3>
							<p>시작의 땅에서 육체를 되찾고 부활한 암흑상제! 신의 관문 안으로 들어간 손오공은 그 안에서 두 가지
								선택의 갈림길에 놓이게 된다.</p>
							<a href="images/book/nb4.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb5.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>트렌드 코리아 2022</h3>
							<p>TIGER OR CAT 검은 호랑이처럼 힘차게 포효하는 2022가 되기를 “우리를 죽이지 못하는 것들은
								우리를 더 강하게 만든다.”</p>
							<a href="images/book/nb5jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb6.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>흔한남매 겨울밤 대소동</h3>
							<p>어린이들에게 특별한 선물이 될 『흔한남매 겨울밤 대소동』! 『흔한남매 겨울밤 대소동』은 겨울을 맞은
								어린이들에게 따뜻한 웃음을 안겨 주는 큰 선물이 될 것입니다</p>
							<a href="images/book/nb6.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb7.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>이순신의 바다</h3>
							<p>60만 구독자 1억뷰 조회의 명강의를 책으로 만나다! 수많은 역사서 제안 러브콜에도 이순신만을 고집하며
								써 내려간, "역사를 역사답게" 알리고 싶은 그의 첫 번째 이야기</p>
							<a href="images/book/nb7.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="images/book/nb8.jpg" alt="">
						<div class="portfolio-overlay">
							<h3>미드나잇 라이브러리</h3>
							<p>25만 부 기념 한정판 ‘퍼플에디션’ 출간! 인생의 두 번째 기회에 대한 마법 같은 이야기 아마존,
								[뉴욕타임스], [선데이타임스] 장기 베스트셀러</p>
							<a href="images/book/nb8.jpg" data-rel="lightbox" class="expand">
								<i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#portfolio -->
</body>
<body>
	<div id="overjoin" class="overlayjoin" style="z-index: 2000;">
		<div class="joinOver">
			<span class="closebtn" onclick="closejoin()" title="close">X</span>
			<h2 style="text-align: center;">
				BZBZ<br>회원가입
			</h2>
			<hr>
			<form action="JoinCon" method="post">
				<input class="mainInfojoin" type="text" name="mb_id" placeholder="ID를 입력해주세요">
					<button onclick="">중복확인</button>
					<input class="mainInfojoin" type="password" name="mb_pw" placeholder="비밀번호를 입력해주세요"> <br> 
					<input class="mainInfojoin" type="text" name="mb_nick" placeholder="사용하실 닉네임을 입력해주세요">
					<button onclick="">중복확인</button>
					<br> <label for="gen" style="margin-left: 35px;">성별<br>
						<input name="mb_gender" type="radio" style="margin-left: 50px;" name="성별" value="M">남 
						<input name="mb_gender" type="radio" name="성별" value="F">여
					</label><br> <br> <label for="age" style="margin-left: 35px;">연령<br>
						<input id="age" name="mb_age" type="radio" style="margin-left: 50px;" value="10">10대
						<input id="age" name="mb_age" type="radio" value="20">20대 
						<input id="age" name="mb_age" type="radio" value="30">30대<br> 
						<input id="age" name="mb_age" type="radio" style="margin-left: 50px;" value="40">40대 
						<input id="age" name="mb_age" type="radio" value="50">50대 
						<input id="age" name="mb_age" type="radio" value="60">60대 이상
				</label><br> <br>
				<hr>
				<input type="submit" class="joinsub" value="회원가입을 완료합니다"> <br>
				<br>
			</form>
		</div>
	</div>
	<div id="overlogin" class="overlaylogin" style="z-index: 2000;">
		<div class="joinOver">
			<span class="closebtn" onclick="closelogin()" title="close">X</span>
			<h2 style="text-align: center;">
				BZBZ<br>로그인
			</h2>
			<hr>
					<form action="LoginCon" method="post"> 
						<input id="loginId" class="mainInfologin" type="text" name="mb_id" placeholder="ID를 입력해주세요"> 
						<input id="loginPw" class="mainInfologin" type="password" name="mb_pw" placeholder="비밀번호를 입력해주세요">
				<br>
				<hr>
				<input type="submit" class="loginsub" value="로그인"> <br>
				<br>
			</form>
		</div>
	</div>

	
	<script>
		function openjoin() {
			document.getElementById("overjoin").style.display = "block";
		}
		function openlogin() {
			document.getElementById("overlogin").style.display = "block";
		}
		function openupdate() {
			document.getElementById("overUpdate").style.display = "block";
		}
		function closejoin() {
			document.getElementById("overjoin").style.display = "none";
		}
		function closelogin() {
			document.getElementById("overlogin").style.display = "none";
		}
		function closeupdate() {
			document.getElementById("overUpdate").style.display = "none";
		}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {

			console.log("로딩");

		});
	</script>
	<div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-xs-12 text-left">
                        <span>보람줄 &copy; 2021 북작북작</span>
                  </div> <!-- /.text-center -->
                    <div class="col-md-4 hidden-xs text-right">
                        <a href="#top" id="go-top">맨 위로</a>
                    </div> <!-- /.text-center -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#footer -->
	<script src="js/vendor/jquery-1.11.0.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')
	</script>
	<script src="js/bootstrap.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
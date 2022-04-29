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
	Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<title>보람줄 - 북잡북잡</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.overlay {
	height: 500px;
}

.overlay img {
	height: 500px;
}
</style>

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/templatemo_style.css">

<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
</head>
<body>
<body class="site-main" id="sTop">
	<div class="site-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-right">
					<ul class="social-icons">
						<nav>
							<a href="Login.html" style="font-size: 20px; font-weight: bold;">로그인
								&nbsp;</a> <a href="Join.html"
								style="font-size: 20px; font-weight: bold;">회원가입</a>
						</nav>
					</ul>
				</div>
				<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
		<div class="main-header">
			<div class="container">
				<div id="menu-wrapper">
					<div class="row">
						<div class="logo-wrapper col-md-2 col-sm-2">
							<h1>
								<a href="#">BZBZ</a>
							</h1>
						</div>
						<!-- /.logo-wrapper -->
						<div class="col-md-10 col-sm-10 main-menu text-right">
							<div class="toggle-menu visible-sm visible-xs">
								<i class="fa fa-bars"></i>
							</div>
							<ul class="menu-first">
								<li class="active"><a href="#">Home</a></li>
								<li><a href="#Bestseller">Best seller</a></li>
								<li><a href="#Newbooks">New books</a></li>
								<li><a href="#our-team">Free Board</a></li>
							</ul>
						</div>
						<!-- /.main-menu -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /#menu-wrapper -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.main-header -->
	</div>
	<!-- /.site-header -->
</body>

<!-- 메인화면-->
<div class="site-slider">
	<div class="slider">
		<div class="flexslider">
			<ul class="slides">
				<%
					TBookDAO dao = new TBookDAO();
				ArrayList<String> arr = dao.selectCover();
				%>
				<%
					for (int i = 0; i < 8; i++) {
				%>
				<li>
					<div class="overlay"></div> <img src="<%=arr.get(i)%>" alt="">
					<div class="slider-caption visible-md visible-lg"></div>
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
				<h2>Best seller</h2>
			</div>
			<!-- /.heading-section -->
		</div>
		<!-- /.row -->
		<div class="row">
			<%
				ArrayList<String> arr1 = dao.selectTitle();
			%>
			<%
				for (int i = 0; i < 8; i++) {
			%>
			<div class="portfolio-item col-md-3 col-sm-6">
				<div class="portfolio-thumb">
					<img src="<%=arr.get(i)%>" alt="">
					<div class="portfolio-overlay">
						<h3><%=arr1.get(i)%></h3>
						<p>따끈따끈한 웃음이 담긴 흔한남매의 일상 스토리! 목감기에 걸린 에이미, 추운 날 등교하는 유형, 중2병
							으뜸이와 사춘기 에이미의 살벌한 대결, 왁자지껄 눈썰매장 스토리, 급똥 위기에 처한 으뜸이와 에이미 등 흔한남매와
							함께 웃다 보면 어느새 마음이 따뜻해질 거예요!</p>
						<a href="images/book/book1.jpg" data-rel="lightbox" class="expand">
							<i class="fa fa-search"></i>
						</a>
					</div>
					<!-- /.portfolio-overlay -->
				</div>
				<!-- /.portfolio-thumb -->
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
				<h2>New books</h2>
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
							명대사와 스틸 사진, 촬영 현장 비하인드 컷, 스페셜 인터뷰까지 『옷소매 붉은 끝동』의 팬이라면 꼭 소장해야 할 책!</p>
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
						<p>시작의 땅에서 육체를 되찾고 부활한 암흑상제! 신의 관문 안으로 들어간 손오공은 그 안에서 두 가지 선택의
							갈림길에 놓이게 된다.</p>
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
						<p>60만 구독자 1억뷰 조회의 명강의를 책으로 만나다! 수많은 역사서 제안 러브콜에도 이순신만을 고집하며 써
							내려간, "역사를 역사답게" 알리고 싶은 그의 첫 번째 이야기</p>
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


<!--작가 소개-->
<div class="content-section" id="our-team">
	<div class="container">
		<div class="row">
			<div class="heading-section col-md-12 text-center">
				<h2>작가 소개</h2>
			</div>
			<!-- /.heading-section -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="team-member col-md-3 col-sm-6">
				<div class="member-thumb">
					<img src="images/mb1.jpg" alt="">
					<div class="team-overlay">
						<h3>이미예</h3>
						<p>대표작 : 달러구르 꿈 백화점</p>
						<span>부산에서 태어났다. 부산대에서 재료공학을 공부하고 반도체 엔지니어로 일했다. 크라우드 펀딩
							프로젝트 『주문하신 꿈은 매진입니다』(現 달러구트 꿈 백화점)으로 첫 소설을 발표해 후원자들의 열렬한 지지를 받아
							성공적으로 펀딩을 종료하였다.</span>
						<ul class="social">
							<li><a href="#" class="fa fa-facebook"></a></li>
							<li><a href="#" class="fa fa-twitter"></a></li>
							<li><a href="#" class="fa fa-linkedin"></a></li>
						</ul>
					</div>
					<!-- /.team-overlay -->
				</div>
				<!-- /.member-thumb -->
			</div>
			<!-- /.team-member -->
			<div class="team-member col-md-3 col-sm-6">
				<div class="member-thumb">
					<img src="images/mb2.jpg" alt="">
					<div class="team-overlay">
						<h3>손원평</h3>
						<p>대표작 : 아몬드</p>
						<span>"매일매일 아이들이 태어난다. 모든 가능성이 열려 있는, 축복받아 마땅한 아이들이다. 그러나
							그들 중 누군가는 사회의 낙오자가 되고 누군가는 군림하고 명령하면서도 속이 비틀린 사람이 된다.</span>
						<ul class="social">
							<li><a href="#" class="fa fa-facebook"></a></li>
							<li><a href="#" class="fa fa-twitter"></a></li>
							<li><a href="#" class="fa fa-linkedin"></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="team-member col-md-3 col-sm-6">
				<div class="member-thumb">
					<img src="images/mb3.jpg" alt="">
					<div class="team-overlay">
						<h3>류시화</h3>
						<p>대표작 : 지금 알고 있는 걸 그때도 알았더라면 열림원</p>
						<span>"우리는 떠나게 되어 있다. 우리에게 주어진 시간도 많지 않다. </span>
						<ul class="social">
							<li><a href="#" class="fa fa-facebook"></a></li>
							<li><a href="#" class="fa fa-twitter"></a></li>
							<li><a href="#" class="fa fa-linkedin"></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="team-member col-md-3 col-sm-6">
				<div class="member-thumb">
					<img src="images/mb4.jpg" alt="">
					<div class="team-overlay">
						<h3>정세랑</h3>
						<P>대표작 : 시선으로부터,문학동네</P>
						<span>소설집 『옥상에서 만나요』, 『목소리를 드릴게요』, 장편소설 『덧니가 보고 싶어』, 『지구에서
							한아뿐』, 『재인, 재욱, 재훈』, 『보건교사 안은영』, 『시선으로부터,』 산문집 『지구인만큼 지구를 사랑할 순
							없어』 등이 있다.</span>
						<ul class="social">
							<li><a href="#" class="fa fa-facebook"></a></li>
							<li><a href="#" class="fa fa-twitter"></a></li>
							<li><a href="#" class="fa fa-linkedin"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-xs-12 text-left">
						<span>보람줄</span>
					</div>
					<div class="col-md-4 hidden-xs text-right">
						<a href="#top" id="go-top">Back to top</a>
					</div>
				</div>
			</div>
		</div>

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
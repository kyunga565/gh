<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/creative.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/home.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/home.js"></script>
-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/home.js"></script>
<script type="text/javascript">
var result = '${result}'
if (result == "success") {
	alert("회원가입에 성공하였습니다.")
	$("#join-wrap").slideToggle(1000)
}
var logout = '${logout}'
if (logout == "success") {
	alert("로그아웃되었습니다.")
}
var addrm = '${insertroom}'
if (addrm == "success") {
	alert("시설이 등록되었습니다.")
}
var error = '${error}' 
if (error == "o") { 
 alert("성공적으로 로그인되었습니다.") 
} else if (error == "x") { 
	alert("아이디 또는 비밀번호를 확인하세요")
} 
var delroom = '${delroom}'
if (delroom == "success") {
	alert("시설이 삭제되었습니다.")
}
var book = '${book}'
if (book == "success") {
	alert("예약에 성공하였습니다.")/* 마이페이지로 이동하시겟습니까?  */
}
$(function(){
var dateFormat = "yy/mm/dd",
     from = $( "#from" ).datepicker({
         defaultDate: "+1w",
         changeMonth: true,
         minDate:"0",
         onClose:function(selDate){
       	  to.datepicker( "option", "minDate", selDate );
         },
         numberOfMonths: 1
       }),
     to = $( "#to" ).datepicker({
       defaultDate: "+1w",  
       changeMonth: true,
       numberOfMonths: 1
     }).on( "change", function() {
       from.datepicker( "option", "maxDate", getDate( this ) );
     });

   function getDate( element ) {
     var date;
     try {
       date = $.datepicker.parseDate( dateFormat, element.value );
     } catch( error ) {
       date = null;
     }

     return date;
   }
})
</script>
</head>
<body id="page-top">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">DAYDAY DAEGU</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                 <% if(session.getAttribute("id") != null ){ %>
                 	<li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/mypage" style="color:#f05f40"> <%=session.getAttribute("id") %> 님 반갑습니다!</a>
                    </li>
                 <%} %>
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">gallery</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#room">Room</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                    <li>
                        <% if(session.getAttribute("id") == null ){ %>
                        	<a class="page-scroll" href="#" id="loginbtn">LoginㆍJoin</a>
                        <% }else{ %>
                        	<a class="page-scroll" href="${pageContext.request.contextPath}/logout">Logout</a>
                        <% } %> 
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
  
        
        
    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1 id="homeHeading"> WELLCOME ! <br> DayDay Daegu GUESTHOUSE </h1>
                <hr>
                <p>저희 D.D.D는 명덕역 도보 1-5분거리 동성로  · 수성못  및  모든지역 10-20분 거리의 최고의 장소에 위치하였습니다. 
                	대구 중심에 위치한 D.D.D에서 전국 각지의 Backpacker 들과 PARTY를 즐기며 소중한 추억을 만들어 보세요.</p>
                <a href="#about" class="btn btn-primary btn-xl page-scroll">Infomation</a>
                <a href="#about" class="btn btn-primary btn-xl page-scroll">Reservation</a>
            </div>
        </div>


		<div id="login-wrap">
			<div class="login-header"></div><!-- 다홍색헤더1px -->
			<div class="login-header2">	<span>LOGIN </span> 
				<a href="" class="closebtn">
				<img src="${pageContext.request.contextPath}/resources/bootstrap/img/x-button.png"  />
				</a>
			</div>
			<div class="login-div">
				<form action="login-post" method="post" name="f0">
					<input type="text" name="uid" placeholder=" 아이디"/><br><br>
					<input type="text" name="upw" placeholder=" 비밀번호"/><br><br>
					<p>
						<button type="submit" class="btn-room" > 로그인  </button>
						<button class="btn-room" id="joinbtn"> 회원가입  </button>
					</p>
				</form>
			</div>
		</div>

		<div id="join-wrap">
			<div class="login-header"></div><!-- 다홍색헤더1px -->
			<div class="login-header2"><span>JOIN </span>
				<a href="" class="closebtn">
					<img src="${pageContext.request.contextPath}/resources/bootstrap/img/x-button.png"  />
				</a>
			</div>
			<div class="login-div">
				<form action="join" method="post" name="f1">
					<input type="text" id="uid" name="uid" placeholder="아이디"/><button type="button" id="checkID">중복확인</button><br>
					<span class="checktrue"> 사용가능한 아이디입니다.</span><span class="checkfalse"> 사용불가능한 아이디입니다.</span><br>
					<input type="text" name="uname" placeholder="이름"/><br><br>
					<input type="text" id="upw0" name="upw0" placeholder="비밀번호"/><br><br>
					<input type="text" id="upw" name="upw" placeholder="비밀번호확인"/><br><span class="checkpw"> 비밀번호를 확인하세요.</span><br>
					<input type="text" name="uaddr" placeholder="주소"/><br><br>
					<input type="text" name="utel" placeholder="전화번호 / -없이 입력하세요"/><br><br><br>
					
					<p>
						<button type="submit" class="btn-room"> 가입하기  </button>
					</p>
				</form>
			</div>
		</div>
		
		
		
		<div id="book-wrap"
			style="color: black; position: absolute; background-color: #f9f9f9;display: none; width: 500px; height: 600px; margin-left: 700px; box-shadow: 0 0 5px gray; margin-top: 200px;">
			<div class="login-header"></div>
			<!-- 다홍색헤더1px -->
			<div class="login-header2">
				<span>BOOKING </span> <a href="" class="closebtn"> <img
					src="${pageContext.request.contextPath}/resources/bootstrap/img/x-button.png" />
				</a>
			</div>
			<div class="login-div">
				<form action="booking" method="post" name="" id="booking">
					<input type="text" name="bno" value="${nextBno }" /><br><br>
					<input type="text" name="uid" placeholder="ㅇㅖ약자" /><br><br>
					 
					
 					<select name="rno">
						<option disabled="disabled" selected="selected"> -----시설이름----- </option>
						<c:forEach items="${roomVO }" var="i">
							<option value="${i.rno }">${i.roomname} / 최대 ${i.people }인 (1인${i.price })</option>
						</c:forEach>
					</select> 
					<br><br>
					
					<select name="person">
						<option disabled="disabled" selected="selected"> -----예약인원----- </option>
						<c:forEach begin="1" end="${maxperson }" step="1" var="test">
							<option value="${test }"> ${test } 명</option>
						</c:forEach>
					</select>
					<br><br>
					
	
					<input type="text" id="from" name="startdate" placeholder="시작일" ><br><br> 
					<input type="text" id="to" name="enddate" placeholder="끝나는일"><br><br>
							
					<select name="state">
						<option disabled="disabled" selected="selected"> -----예약상태----- </option>
						<option value="예약">예약</option>
					</select> 
					<br><br>
					
					<p>
						<button type="submit" class="btn-room" id="res">예약하기</button>
					</p>
				</form>
			</div>
		</div>
		
		
		
	</header>

	<section class="bg-primary" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center" id="con">
					<h2 class="section-heading">About GUESTHOUSE</h2>
					<hr class="light">
					<p class="text-faded">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3233.8379472705237!2d128.5887173152635!3d35.85297698015451!
                    		2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3565e3a2893fe30b%3A0x8887a026f9524b62!2z64yA6rWs7JWE7J207Yuw6rWQ7Jyh7JuQKO
                    		uMgOq1rElU6rWQ7Jyh7JuQKQ!5e0!3m2!1sen!2skr!4v1495777533057"
							width="600" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
						<span class="about-g">Location</span><br>대구광역시 남구 중앙대로 220,3층(대명동, 다산빌딩)<br>
						<br> <span class="about-g">Checkin-checkout</span><br>14: 00 PM - 11 : 00 AM<br>
						<br> <span class="about-g">Breakfast time</span><br>8 : 00 ~ 10 : 00 AM<br>
						<br> <span class="about-g">Notice</span><br>
						게스트하우스 안에서는 금연입니다.<br> 
						체크인 후에는 환불불가입니다.<br> 
						분실물에 주의하세요.<br>
						지하 카페는 08시부터 00시까지 이용이 가능합니다.<br> 
						옥상은 00시 이후 출입을 금합니다.<br>
					</p>
					<a href="" class="page-scroll btn btn-default btn-xl sr-button" id="gobook">예약하기!</a>
				</div>
			</div>
		</div>
	</section>

	
	<form action="" method="post" id="f">
		<c:forEach var="i" items="${roomVO }">
	 		<input type="hidden" value=" ${i.rno}" name="rno"/> &nbsp;&nbsp; 
	 	</c:forEach>
	</form>

	
	

	<section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Reasons to stay with us</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-paper-plane text-primary sr-icons"></i>
                        <h3>24HR ACCESS</h3>
                         <p class="text-muted"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/24-hours.png" width="100px"></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-diamond text-primary sr-icons"></i>
                        <h3>FREE WIFI</h3>
                        <p class="text-muted"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/wifi.png" width="100px"></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-newspaper-o text-primary sr-icons"></i>
                        <h3>GREAT LOCATIONS</h3>
                        <p class="text-muted"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/placeholder.png" width="100px"></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart text-primary sr-icons"></i>
                        <h3>FANTASTIC STAFF</h3>
                        <p class="text-muted"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/company-workers.png" width="100px"></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart text-primary sr-icons"></i><br>
                        <h3>SECURE ACCESS</h3>
                        <p class="text-muted"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/padlock.png" width="100px"></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart text-primary sr-icons"></i><br>
                        <h3>CLEANING</h3>
                        <p class="text-muted"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/wiping.png" width="100px"></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart text-primary sr-icons"></i><br>
                        <h3>ACTIVITIES</h3>
                        <p class="text-muted"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/wine.png" width="100px"></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart text-primary sr-icons"></i><br>
                        <h3>FREE BREAKFAST</h3>
                        <p class="text-muted"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/donut.png" width="100px"></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="no-padding" id="portfolio">
        <div class="container-fluid">
            <div class="row no-gutter popup-gallery">
                <div class="col-lg-4 col-sm-6">
                    <a href="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/fullsize/muji1.jpg" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/thumbnails/muji1.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    living room
                                </div>
                                <div class="project-name">
          	       크게보기
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/fullsize/muji2.jpg" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/thumbnails/muji2.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    kitchen
                                </div>
                                <div class="project-name">
                                    크게보기
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/fullsize/muji3.jpg" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/thumbnails/muji3.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    living room
                                </div>
                                <div class="project-name">
                                    크게보기
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/fullsize/muji4.jpg" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/thumbnails/muji4.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    living room
                                </div>
                                <div class="project-name">
                                    크게보기
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/fullsize/muji5.jpg" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/thumbnails/muji5.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    kitchen
                                </div>
                                <div class="project-name">
                                    크게보기
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/fullsize/muji6.jpg" class="portfolio-box">
                        <img src="${pageContext.request.contextPath}/resources/bootstrap/img/portfolio/thumbnails/muji6.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    kitchen
                                </div>
                                <div class="project-name">
                                    크게보기
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>
    </section>
 
 
 
 
 
 
 
    <aside class="bg-dark" id="room">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>객실정보가 궁금하다면 ? </h2>
                <a href="" class="btn btn-default btn-xl sr-button" id="roominfo">객실정보 상세히보기</a> &nbsp;&nbsp;
                <a href="" class="btn btn-default btn-xl sr-button" id="roomadd">객실등록하기(admin)</a>
            </div>
        </div>
    </aside>

	<section id="addroom-wrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<form action="insertroom" method="post" name="f2" enctype="multipart/form-data">
						<p style="font-weight:bold">INSERT ROOM</p>
						<hr ><br>
					 	<input type="text" value=" ${nextRno }" readonly="readonly" name="rno" /> &nbsp;&nbsp; 
						<input type="text" name="roomname" placeholder="시설이름" /><br><br>
						<input type="text" name="price" placeholder="가격" /> &nbsp;&nbsp;
						<input type="text" name="people" placeholder="수용인원" /><br><br>
						<textarea name="content" id="contents" cols="62" rows="5"placeholder="시설설명"></textarea><br><br>
						<input type="file" name="imagefiles" multiple="multiple" placeholder="시설사진" /><br><br>
						
						<button type="submit"  class="btn-room">시설추가</button>
						<button type="reset" class="btn-room">추가취소</button>
					</form>
				</div>
			</div>
		</div>
	</section>


	
	
	<section id="modroom-wrap" style="display: none;">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<form action="updateroom" method="post" name="f3" enctype="multipart/form-data">
						<p style="font-weight:bold">UPDATE ROOM</p>
						<hr ><br>
					 	<input type="text" name="rno" readonly="readonly" /> &nbsp;&nbsp; 
						<input type="text" name="roomname"/><br><br>
						<input type="text" name="price"/> &nbsp;&nbsp;
						<input type="text" name="people"/><br><br>
						<textarea name="content" cols="62" rows="5"></textarea><br><br>
						<input type="file" name="imagefiles" multiple="multiple" /><br><br>
						
						<button type="submit"  class="btn-room">시설수정</button>
						<button type="reset" class="btn-room">수정취소</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	
	
	<section id="subroom" style="display: none;">
		<div class="container">
			<div class="row">
				<c:forEach var="i" items="${roomVO }">
					<div class="col-lg-8 col-lg-offset-2 text-center" style="border:0.7px dotted #d2e1e7;width: 75%;">
						<c:forEach var="pic" items="${i.files }">
							<img src="displayFile?filename=${pic }" style="width:500px;height:350px; float: left;" /><br>
						</c:forEach>
						<h2 class="section-heading"><span class="r_name">${i.roomname }</span>
													(<span class="r_people">${i.people }</span>인실)</h2>
						<hr class="primary">
						<p >
							인당 - <span class="r_price"><fmt:formatNumber pattern="###,###">${i.price }</fmt:formatNumber></span>원 <br><br>
						</p>
						<p class="r_content">${i.content }</p> <!-- class="btn-room" -->
						
						<button class="updateroom1" style="border:1px solid #d2e1e7;padding:10px; 
						margin:10px; color:#f05f40; border-radius:10px; background-color:#d2e1e7; 
						font-size: 12px;font-weight: bold;" value="${i.rno }">수정</button> 
						
						<button class="deleteroom" style="border:1px solid #d2e1e7;padding:10px; 
						margin:10px; color:#f05f40; border-radius:10px; background-color:#d2e1e7; 
						font-size: 12px;font-weight: bold;" value="${i.rno }">삭제</button>
						
						<br><br><br>
					</div>
				</c:forEach>
			</div><br><br><br><br>
		</div>
	</section>




	<section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading"> Contact Us </h2>
                    <hr class="primary">
                    <p>궁금한 점이 있다면 언제든지 문의하세요 ! </p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x sr-contact"></i>
                    <p>Call : 053-555-1545</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                    <p>E-mail : <a href="mailto:dnldzmdnldzm@hanmail.com">parkkyunga@dgit.com</a></p>
                </div>
            </div>
        </div>
    </section>


   
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/creative.min.js"></script>

</body>

</html>
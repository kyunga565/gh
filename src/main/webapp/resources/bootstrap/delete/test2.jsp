<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/creative.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/home2.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<!-- ------------------------------------------------------------------------------ -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/home.js"></script>
<script>
$( function() {
    var dateFormat = "yy/mm/dd",
      from = $( "#from" ).datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          minDate:"0",
          onClose:function(selDate){
        	  to.datepicker( "option", "minDate", selDate );
          },
          numberOfMonths: 1
        })/* .on( "change", function() {
          to.datepicker( "option", "minDate", "0" );
        }) */,
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
  } );
</script>
<!-- ------------------------------------------------------------------------------ -->

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
					<%
						if (session.getAttribute("id") != null) {
					%>
					<li>
						<a class="page-scroll" style="color: #f05f40"> <%=session.getAttribute("id")%> 님 반갑습니다! </a>
					</li>
					<%
						}
					%>
					<li><a class="page-scroll" href="#about">About</a></li>
					<li><a class="page-scroll" href="#services">Services</a></li>
					<li><a class="page-scroll" href="#portfolio">gallery</a></li>
					<li><a class="page-scroll" href="#room">Room</a></li>
					<li><a class="page-scroll" href="#contact">Contact</a></li>
					<li> <%
							if (session.getAttribute("id") == null) {
						%> <a class="page-scroll" href="#" id="loginbtn">LoginㆍJoin</a> <%
					 	} else {
						 %> <a class="page-scroll" href="${pageContext.request.contextPath}/logout">Logout</a> <% }  %> </li>
				</ul>
			</div>
		</div>
	</nav>



	<header>
		<div class="header-content">
			<div class="header-content-inner">
				<h1 id="homeHeading">
					WELLCOME ! <br> DayDay Daegu GUESTHOUSE
				</h1>
				<hr>
				<p>저희 D.D.D는 명덕역 도보 1-5분거리 동성로 · 수성못 및 모든지역 10-20분 거리의 최고의 장소에
					위치하였습니다. 대구 중심에 위치한 D.D.D에서 전국 각지의 Backpacker 들과 PARTY를 즐기며 소중한 추억을
					만들어 보세요.</p>
				<a href="#about" class="btn btn-primary btn-xl page-scroll">Infomation</a>
				<a href="#about" class="btn btn-primary btn-xl page-scroll">Reservation</a>
			</div>
		</div>


		<div id="book-wrap"
			style="color: black; position: absolute; background-color: #f9f9f9; width: 500px; height: 600px; margin-left: 700px; box-shadow: 0 0 5px gray; margin-top: 200px;">
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
						<option value="예약">예약</option>
						<option value="예약대기">예약대기</option>
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
					<a href="" class="page-scroll btn btn-default btn-xl sr-button" id="gobook">예약하기!</a>
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
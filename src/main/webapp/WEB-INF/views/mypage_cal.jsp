<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Datepicker - Select a Date Range</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/fullcalendar.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/creative.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/sweetalert.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style type="text/css">
#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>
<body id="page-top">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="${pageContext.request.contextPath}/main">DAYDAY DAEGU</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                 <% if(session.getAttribute("id") != null ){ %>
                 	<li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/mypage" style="color:#f05f40"> <%=session.getAttribute("id") %> 님 반갑습니다!</a>
                    </li>
                    <li>
                    	<a class="page-scroll" href="${pageContext.request.contextPath}/mypage_res" style="color:#f05f40"> MYreservation </a>
                    </li>
                 <%} %>
                    <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/main">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/main">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/main">Gallery</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/main">Room</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="">Contact</a>
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
  <br><br><br>
      
    
	<input type="hidden" id="session-id" value="<%=session.getAttribute("id") %>" />
		
	
	
	
	
		<div id="book-wrap-cal" style="color: black;position:absolute ;display:none; background-color:#f9f9f9; z-index:999; width: 500px; height: 600px; margin:700px; margin-top: 200px; box-shadow: 0 0 5px gray;">
			<div class="login-header"></div>
			<div class="login-header2">
				<span>BOOKING </span> <a href="" class="book-closebtn"> <img
					src="${pageContext.request.contextPath}/resources/bootstrap/img/x-button.png" />
				</a>
			</div>
			<div class="login-div" style="text-align: center;">
				<form action="booking_cal" method="post" name="f4" id="booking">
					<input type="text" name="bno" value="${nextBno }" readonly="readonly"/><br><br>
					<input type="text" name="uid" value="<%=session.getAttribute("id")%>" readonly="readonly"/><br><br>
					 
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
					
	
					<input type="text" id="from"  name="startdate"  placeholder="시작일" ><br><br> 
					<input type="text" id="to" name="enddate" placeholder="끝나는일"><br><br>
							
					<select name="state">
						<option value="예약">예약</option>
					</select> 
					<br><br>
					
					<p>
						<button type="submit" class="btn-room" id="res">예약하기</button>
					</p>
				</form>
			</div>
		</div>
	
	
	
	
	
	
	
		
		
<div id="section-wrap" style="background-color: rgba(218,207,118,0.1);" >
	
	<section id="admin_reservation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">MY RESERVATION</h2><a href="${pageContext.request.contextPath}/mypage_res">리스트로보기</a>
                   
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
				<div class="text-center">
					<div style="margin: 5px auto 0; width: 95%;">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
        </div>
    </section>
</div><!-- end of #section-wrap -->
   
	<section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading"> Contact Us </h2>
                    <hr class="primary">
                    <p>궁금한 점이 있다면 언제든지 문의하세요 !</p>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/scrollreveal/scrollreveal.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/creative.min.js"></script>
<script src='${pageContext.request.contextPath}/resources/bootstrap/js/moment.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/sweetalert.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){
	$('#calendar').fullCalendar({
		header: {
			left: 'today ',
			center: 'prev title next',
			right: 'month',
		},
		defaultDate: new Date(),
		navLinks: true,
		defaultValue: "month",
		selectable: true,
		monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNames:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		dayNamesShort: ["일","월","화","수","목","금","토"],
		validRange: {
	        start:  new Date() 
	    },
		buttonText:{today:"오늘",month:"월별",week:"주별",day:"일별"},
		eventLimit: true,
			  selectable : true,
			  selectHelper : true,
			  select : function(start,end) {
			  swal({
			 	title:"예약하시겠습니까?",
				text: start.format()+" ~ " + end.format(),
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Yes",
				  closeOnConfirm: true  
			   },function(){
				   $("#book-wrap-cal").slideToggle(1000);
				   $("#from").val(start.format());
				   $("#to").val(end.format())
				  
				   $(".book-closebtn").click(function(e) {
					e.preventDefault();
				 	$("#book-wrap-cal").slideUp(1000)
				})
				
			   })
			  },
		events: [
            <c:forEach var="a" items="${END}">
			{
			  title: '${a.roomname} (${a.state})',
			  content :'${a.uid} <br> ${a.state} 상태 <br>'+
			  ' <fmt:formatDate pattern="yyyy-MM-dd" value="${a.startdate}" /> ~'+
			  ' <fmt:formatDate pattern="yyyy-MM-dd" value="${a.enddate}" />',
			  start: '<fmt:formatDate pattern="yyyy-MM-dd" value="${a.startdate}" />',
			  end:'<fmt:formatDate pattern="yyyy-MM-dd" value="${a.enddate}" />'
			  <c:choose>
			  <c:when test="${a.state=='예약취소'}">,color : '#d2e1e7'</c:when>
		      <c:when test="${a.state=='예약'}">,color : '#f0634b'</c:when>
		      <c:when test="${a.state=='예약종료'}">,color : '#cdcdcd'</c:when>
		      <c:otherwise>,color : '#f0634b' </c:otherwise>
			  </c:choose>
			},
            </c:forEach>
            ],
		eventClick:function(e){
			swal({
				title:"예약정보",
				text:"<b style='color:#f8a760'>"+e.content+"</b>",
				html:true
			})
		}
	})
	
	var sessionid = $("#session-id").val();
	
	
	

	
	var dateFormat = "MM/dd/yyyy",
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
</body>
</html>
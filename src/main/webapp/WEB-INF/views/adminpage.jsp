<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/creative.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/sweetalert.css" rel="stylesheet">

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
</head>
<body id="page-top">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="${pageContext.request.contextPath}/test">DAYDAY DAEGU</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                 <% if(session.getAttribute("id") != null ){ %>
                 	<li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/adminpage" style="color:#f05f40"> <%=session.getAttribute("id") %></a>
                    </li>
                 <%} %>
                    <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/test/#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/test/#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/test/#portfolio">Gallery</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/test/#room">Room</a>
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
      
  	
		
<div id="section-wrap" style="background-color: rgba(218,207,118,0.1);">
	<section id="admin_reservation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">RESERVATION LIST</h2><a href="${pageContext.request.contextPath}/adminpage_cal">달력으로보기</a>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
				<div class="text-center">
					<div style="margin: 5px auto 0; width: 95%;">
						<table id="admin_mypagetable" style="border:2px dotted #d2e1e7;width:100%;">
	 						<c:forEach items="${ADMIN }" var="m">
								<tr style="border:2px dotted #d2e1e7;" class="tr-color" >
									<input type="hidden" value="${m.bno }" class="bno-input" />
									<td> &nbsp;&nbsp; No.${m.bno } <br>&nbsp;&nbsp;${m.uid }</td>
	 						 		<td style="padding:10px;">
										<c:forEach var="pic" items="${m.files }">
											<img src="displayFile?filename=${pic }" style="width: 200px; height: 120px;" /><br>
										</c:forEach>
									</td>
									<td width="310px;"><b>< ${m.roomname } ></b><br>${m.content }</td>
									<td><span class="person_admin">
										${m.person }명 / 총금액<br><b><fmt:formatNumber pattern="###,###"> ${m.price*m.person }</fmt:formatNumber></b> 원 
									</span>
									<span class="person_admin_update" style="display: none;">
										<input type="number" value="${m.person }"  />명
									</span>
									</td>  
									
									<td><b class="date_admin"><fmt:formatDate value="${m.startdate}" /> ~ 
										<fmt:formatDate value="${m.enddate}" /></b>
										<span class="date_admin_update" style="display: none;">
											<input type="text" class="from2" value='<fmt:formatDate pattern="MM/dd/yyyy" value="${m.startdate }"/>'/><br>
											<input type="text" class="to2" value='<fmt:formatDate pattern="MM/dd/yyyy" value="${m.enddate }"/>'/>
										</span>
									</td>
									<td style="width:100px;">
										<p class="btn-state-admin">${m.state}</p>
										<select name="" class="state-admin" style="display: none;">
											<option value="예약">예약</option>
											<option value="예약취소">예약취소</option>
										</select>
									</td>
									<td style="width:100px;"><button value="${m.bno }" class="btn-state-update">수정하기</button></td>
								</tr>
							</c:forEach>		
						</table>
					</div>
				</div>
			</div>
			<div id='calendar'></div>
        </div>
    </section>
</div><!-- end of #section-wrap -->
   
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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/home.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/scrollreveal/scrollreveal.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/creative.min.js"></script>

<!-- datepicker -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
$(function(){
var dateFormat = "yy/mm/dd",
     from = $( ".from2" ).datepicker({
         defaultDate: "+1w",
         changeMonth: true,
         minDate:"0",
         onClose:function(selDate){
       	  to.datepicker( "option", "minDate", selDate );
         },
         numberOfMonths: 1
       }),
     to = $( ".to2" ).datepicker({
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
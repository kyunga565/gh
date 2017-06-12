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
<link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/creative.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/home.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/home.js"></script>
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
  
        


	<input type="hidden" id="session-id" value="<%=session.getAttribute("id") %>" />
	
	

	<section id="mypage">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">MYPAGE</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="text-center" style="border:2px dotted #d2e1e7;width:50%;margin:0 auto;">
                    <div style="width:80%;margin:0 auto;padding:40px;">
                    	<c:forEach items="${userVO }" var="i">
                    	<table>
                    		<tr>
                    			<td style="width:100px;color:#222222;font-weight: bold;">아이디(암호)</td>
                    			<td style="padding:20px;"> ${i.uid } (${i.upw })</td>
                    		</tr>
                    		<tr>
                    			<td style="color:#222222;font-weight: bold;">이름</td>
                    			<td style="padding:20px;">${i.uname }</td>
                    		</tr>
                    		<tr>
                    			<td style="color:#222222;font-weight: bold;">주소</td>
                    			<td style="padding:20px;">${i.uaddr }</td>
                    		</tr>
                    		<tr>
                    			<td style="color:#222222;font-weight: bold;">전화번호</td>
                    			<td style="padding:20px;">${i.utel }</td>
                    		</tr>
                    	</table>
                    	</c:forEach>
                    </div>
                <button class="btn-room">수정</button><button class="btn-room">회원탈퇴</button><br><br><br>
                </div>
            </div>
        </div>
    </section>
    
	<section id="reservation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">MY RESERVATION</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
				<div class="text-center">
					<div style="margin: 5px auto 0; width: 95%;">
						<c:forEach items="${myinfo }" var="m">
							<table id="mypagetable" style="border:2px dotted #d2e1e7; border-collapse: collapse;width:95%;margin:0 auto;">
								<tr>
									<td style="padding:10px;">
										<c:forEach var="pic" items="${roominfo.files }">
											<img src="displayFile?filename=${pic }" style="width: 200px; height: 120px;" /><br>
										</c:forEach>
									</td>
									<td>No.${m.bno } </td>
									<td>< ${roominfo.roomname } ><br>${roominfo.content }</td>
									<td style="padding:10px;">${m.person }명 </td>
									<td>금액합계<br>${roominfo.price }원 </td>
									<td><fmt:formatDate value="${m.startdate}" /> ~ <fmt:formatDate value="${m.enddate}" /></td>
									<td style="width:100px;"><button class="btn-room" id="btnstate">${m.state}</button></td>
								</tr>
								
							</table>
						</c:forEach>


						
					</div>
				</div>


			</div>
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


    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/creative.min.js"></script>

</body>

</html>
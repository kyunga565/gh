<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day Day Daegu</title>
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
                <a class="navbar-brand page-scroll" href="${pageContext.request.contextPath}/main">DAYDAY DAEGU</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                 <% if(session.getAttribute("id") != null ){ %>
                 	<li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/adminpage" style="color:#f05f40"> <%=session.getAttribute("id") %></a>
                    </li>
                 	<li>
                        <a class="page-scroll" href="${pageContext.request.contextPath}/adminpage_mem" style="color:#f05f40"> MEMBERS</a>
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
      
<div id="section-wrap" style="background-color: rgba(218,207,118,0.1);">
	<section id="admin_reservation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">MEMBER LIST</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
				<div class="text-center">
					<div style="margin: 5px auto 0; width: 80%;">
						<table id="admin_membertable" style="border:2px dotted #d2e1e7;width:100%;">
									<tr style="color:#f05f40;">
										<td width="160px;"><b>아이디</b></td>
										<td><b>이름</b></td>
										<td><b>주소</b></td>
										<td><b>전화번호</b></td>
										<td></td>
									</tr>
		 					<c:forEach items="${MEM }" var="m">
								<form action="updatebookroom" method="post" name="f7" >
									<tr style="border:2px dotted #d2e1e7;" class="tr-color" >
										<c:if test="${m.uid == 'admin'}">
											<td style="text-align: left;padding-left:30px;"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/icon1.png" style="width:20px;" /> ${m.uid }</td>
										</c:if>
										<c:if test="${m.uid != 'admin' }">
											<td style="text-align: left;padding-left:30px;"><img src="${pageContext.request.contextPath}/resources/bootstrap/img/icon2.png" style="width:20px;" /> ${m.uid }</td>
										</c:if>
										
										<td><b>${m.uname }</b></td>
										<td width="380px;" style="text-align: left;">${m.uaddr }</td>
										<td>${m.utel }</td>
										<td style="width:150px;"><button value="${m.uid }" class="btn-mem">예약현황보기</button></td>
									</tr>
								</form>	
							</c:forEach>		
						</table>
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
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/moment.min.js"></script>
<script type="text/javascript">
$(function(){
/* 회원목록에서 예약현황보기 */
$(".btn-mem").each(function(i, obj) {
	$(".btn-mem").eq(i).click(function(e){
		e.preventDefault();
		var uid = $(this).val()
		console.log(uid)
		$.ajax({
			url:"mem",
			data:{"uid":uid},
			dataType:"json",
			type:"get",
			success:function(data){
				console.log(data)
				console.log(data.length)
				if(data.lenght == null){
					swal("최신예약정보가 없습니다.")
				}
 				for(var i=0;i<data.length;i++){
					swal({
						title:data[0].uid+"님의 예약",
						html:true,
						text:
							'<img src="displayFile?filename='+data[i].files+'" style="width:250px;height:150px;float:left" />'
							+ "<br><b>"+ moment(data[i].startdate).format("YYYY/MM/DD ~")
							+ moment(data[i].enddate).format("YYYY/MM/DD")+"</b><br>"
							+ data[i].roomname+"<br>"
							+ data[i].person+"명<br>" 
							+ "결제금액 :" +data[i].price+"원<br>" 
							+ "<b style='color:black;'>"+data[i].state+"</b><br>" 
							,
					})
				} 

			},error:function(){
				console.log("에러")
			}
		})
		
	})
	
})

})

</script>
</body>
</html>
$(function() {
	/* 시설정보 */
	$("#roominfo").click(function(e) {
		e.preventDefault();
		$("#subroom").slideToggle(1000)
	})
	/* 로그인 화면 */
	$("#loginbtn").click(function(e) {
		e.preventDefault();
		$("#login-wrap").slideToggle(1000)
	})
	$(".closebtn").eq(0).click(function(e) {
		e.preventDefault();
		$("#login-wrap").slideToggle(1000)// .css("visibility","hidden")
	})
	$(".closebtn").eq(1).click(function(e) {
		e.preventDefault();
		$("#join-wrap").slideToggle(1000)// .css("display","none")
	})
	/* 회원가입 화면 */
	$("#joinbtn").click(function(e) {
		e.preventDefault();
		$("#login-wrap").css("display", "none")
		$("#join-wrap").slideToggle(1000)
	})
	/* 회원가입할때 비밀번호 */
	$("form[name='f1']").submit(function() {
		if ($("#upw0").val() != $("#upw").val()) {
			var $next = $("#upw").nextAll(".checkpw").eq(0)
			$next.css("display", "inline")
			return false
		}
	})
	/* 회원가입할때 아이디중복체크 */
	$("#checkID").click(function(e) {
		e.preventDefault();
		var id = $("#uid").val()
		var result;
		$.ajax({
			url : "idCheck/" + id,
			data : id,
			type : "get",
			dataType : "text",
			success : function(data) {
				if (data == "success") {
					result = true
					$(".checktrue").css("display", "inline")
					$(".checkfalse").css("display", "none")
				} else {
					result = false
					$(".checkfalse").css("display", "inline")
					$(".checktrue").css("display", "none")
				}
			}
		})
		return result
	})
	/* 시설등록화면보기 */
	$("#roomadd").click(function(e) {
		e.preventDefault();
		$("#addroom-wrap").slideToggle(1000)
	})
	/*시설삭제 */
	 $(".deleteroom").click(function() { //삭제시 form이 들고있는 bno도 가져감
	 $("#f").attr("action", "deleteroom")
	 $("#f").submit()
	 })

	 /* 클릭하면 수정화면에 정보넣기 */
	 $(".updateroom1").each(function(i) {
		 $(this).click(function(e){
	
			e.preventDefault();
			var rno = $(this).val()
			var r_name = $(".r_name").eq(i).text()
			var r_people = $(".r_people").eq(i).text()
			var r_content = $(".r_content").eq(i).text()
			var r_price = $(".r_price").eq(i).text()

			$.ajax({
				url : "test",
				data : rno,
				type : "get",
				dataType : "text",
				success : function() {
					$("form[name='f3'] input[name='rno']").val(rno)
					$("form[name='f3'] input[name='roomname']").val(r_name)
					$("form[name='f3'] input[name='people']").val(r_people)
					$("form[name='f3'] input[name='price']").val(r_price)
					$("form[name='f3'] textarea").text(r_content)
				},
				error : function() {
					alert("에러")
				}
			})
		})
	})
	
	
})




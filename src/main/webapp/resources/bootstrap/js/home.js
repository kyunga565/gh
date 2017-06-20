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
	$(".closebtn").eq(2).click(function(e) {
		e.preventDefault();
		$("#book-wrap").slideToggle(1000)
	})
	$(".mem-closebtn").eq(0).click(function(e) {
		e.preventDefault();
		$("#member-pw-update-wrap").slideToggle(1000)
	})
	$(".mem-closebtn").eq(1).click(function(e) {
		e.preventDefault();
		$("#member-info-update-wrap").slideToggle(1000)
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
	/* 시설삭제 */
	$(".deleteroom").each(function(i,obj){
		$(".deleteroom").eq(i).click(function(){
			swal({
			  title:"해당 시설을 삭제하시겠습니까?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "Yes",
			  closeOnConfirm: true
			},function(){
				$(".f").eq(i).submit()
			})
		})
	});

	
	/* 클릭하면 수정화면에 정보넣기 */
	$(".updateroom1").each(function(i) {
		$(this).click(function(e) {
			$("#modroom-wrap").slideDown(1000).css("display", "block")
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
	/* 예약하기버튼누르면 예약화면 */
	$("#gobook").click(function(e) {
		e.preventDefault();
		$("#book-wrap").slideToggle(1000)
	})

	/* 예약하기버튼누르면 예약화면 */
	$("#gobook2").click(function(e) {
		e.preventDefault();
		$("#book-wrap").slideToggle(1000)
	})
	/* 회원탈퇴 */
	$("#dropout").click(function(e) {
		e.preventDefault();
		var sessionID = $("#session-id").val()
		swal({
			  title: "정말 탈퇴하시겠습니까?",
			  text: "탈퇴시 회원정보는 모두 사라집니다.",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "Yes",
			  closeOnConfirm: true
		},function(){
			$.ajax({
				url : "dropout",
				dataType : "text",
				data : sessionID,
				type : "get",
				success : function() {
					swal("탈퇴완료!","정상적으로 탈퇴되었습니다.","success");
					self.location = "test"
				},error : function() {
					alert("탈퇴실패")
				}
			})
		})
	})
	
	
	
	/* ㅇㅖ약 ->예약취소 */
	$(".btn-state").each(function(i) {
		var bno = $(".bno-input").eq(i).val()
		if ($(".btn-state").eq(i).text() == "예약취소") {
			$(".tr-color").eq(i).css("opacity", "0.4")
		}
		if ($(".btn-state").eq(i).text() == "예약종료") {
			$(".tr-color").eq(i).css("opacity", "0.4")
		}
		if ($(".btn-state").eq(i).text() == "예약") {
			$(".btn-state").eq(i).mouseover(function() {
				$(".btn-state").eq(i).text("예약취소").click(function() {
				swal({
					title: "예약취소",
					text: "해당 예약을 취소 하시겠습니까?",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "Yes",
					closeOnConfirm: true
				},function(){
					$.ajax({
						url : "changeState",
						dataType : "text",
						data : {"bno" : bno},
						type : "get",
						success : function() {
						//	$('#reservation').load(document.URL+ ' #reservation .container');
						
							self.location="mypage"
							
							
							}
						})
					})
				})
			})
			$(".btn-state").eq(i).mouseout(function() {
				$(".btn-state").eq(i).text("예약")
			})
		}
	})

	/* 회원정보 수정할때 비밀번호 */
	$("form[name='f5']").submit(function() {
		if ($("#upw0").val() != $("#upw").val()) {
			var $next = $("#upw").nextAll(".checkpw").eq(0)
			$next.css("display", "inline")
			return false
		} else if ($("#default_pw").val() != $("#default_pw2").val()) {
			var $next2 = $("#default_pw2").nextAll(".default_checkpw").eq(0)
			$next2.css("display", "inline")
			return false
		}
	})

	/* 비밀번호 수정화면 */
	$("#chPW").click(function(e) {
		e.preventDefault();
		$("#member-pw-update-wrap").slideToggle(1000)
	})

	/* 회원정보 수정화면 */
	$("#updatemem").click(function(e) {
		e.preventDefault();
		$("#member-info-update-wrap").slideToggle(1000)
	})

	/* mypage에서 버튼에 마우스올리면 */
	$("#mypage button").each(function(i) {
		$("#mypage button").eq(i).mouseover(function() {
			$(this).css("color", "red")
		})
		$("#mypage button").eq(i).mouseout(function() {
			$(this).css("color", "#f05f40")
		})
	})
	/* subroom에서 ㅇㅖ약하기 버튼 누르면 */
	$(".bookroom").each(function(i){
		$(".bookroom").eq(i).click(function(){
			var rno = $(this).val()
			$("#book-wrap select[name='rno']").val(rno)
			$("#book-wrap").slideToggle(1000)
		
		})
	})
	
	
	$(".btn-state-update").each(function(i) {
		$(".btn-state-update").eq(i).mouseover(function() {
			$(this).css("color","red").click(function(e){
				e.preventDefault();
				$(".date_admin_update").eq(i).css("display","block")
				$(".date_admin").eq(i).css("display","none")
				
				$(".person_admin_update").eq(i).css("display","block")
				$(".person_admin").eq(i).css("display","none")
				
				$(".state-admin").eq(i).css("display","block")
				$(".btn-state-admin").eq(i).css("display","none")
				
				$(".btn-state-update").eq(i).text("수정완료").click(function(){
					$("form[name='f7']").eq(i).submit()
				})
			})
		})
		$(".btn-state-update").eq(i).mouseout(function() {
			$(this).css("color","#f05f40")
		})
	})

if($("#crop").text("▲")){
	$("#crop").click(function(e){
		e.preventDefault();
		$("#mypage_crop").slideUp(500)
		$("#crop").text("▼")
	})
}else{
	$("#crop").click(function(e){
		e.preventDefault();
		$("#mypage_crop").slideDown(500)
		$("#crop").text("▲")
	})
}
			
			

	
		
	
	
	
	
})


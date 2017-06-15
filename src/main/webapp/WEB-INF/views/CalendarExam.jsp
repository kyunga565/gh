<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Datepicker - Select a Date Range</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='${pageContext.request.contextPath}/resources/bootstrap/js/moment.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/fullcalendar.js"></script>
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/fullcalendar.css" rel="stylesheet">
<!-- <script>
  $( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2
      })
      .on( "change", function() {
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
  </script> -->
  
<script>
/* function initCalendar(objDiv)
{
 mObjCalendar = objDiv;
  */
 $(function(){

	 var arrEvents =[
	     {
	      id:9,
	      title: 'All Day Event',
	      start: '2016-05-01',
	      end : '2016-05-02',
	      editable : true
	     },
	     {
	      id: 10,
	      title: 'Repeating Event',
	      start: '2016-05-09',
	      end : '2016-05-10'
	     }
	 ];
	 
	 $('#calendar').fullCalendar({
		  header : {
		   left : 'prev',
		   center : 'title,today',
		   right : 'next'
		  },
		  /* defaultDate: '2016-05-12', // 달력 초기화시 지정된 일자의 달력을 보여줌 */
		  Lang:'ko',      // 언어 설정
		  height : onCalendarHeight,  // 높이 재설정, 윈도우 리사이즈시에도 실행
		  selectable : true,
		  selectHelper : true,
		  aspectRatio: 2,  // 가로세로 폭
		  select : function(start,end) {
		   alert(start.format()+" ~ " + end.format());
		  },
		  editable: true,
		  eventLimit: true,
		  views : {
		   day : 'yyyy mm dd'
		  },
		  events: arrEvents,
		  eventDragStop : function(event,jsEvent,ui,view) {
		   console.log("dragStop:" + event);
		  },
		  eventResizeStop : function(event,jsEvent,ui,view) {
		   console.log("resizeStop:" + event);
		  },
		  eventColor : '#91d7ff',
		  eventTextColor : 'black',
		  eventBorderColor : 'green',
		  dayClick: function(date, jsEvent, view) { // 날짜 클릭시

		   // 선택한 날짜를 이용해 Date객체 생성
		   var arrTodayDate = date.format().split("-");
		   alert(date.format());
		   var dtToday = new Date(arrTodayDate[0],arrTodayDate[1]-1,arrTodayDate[2]);
		         
		   // 선택한 날짜의 작업들을 저장할 배열 Events
		         var toDayEvents = [];
		         for(var intIndex=0;intIndex<arrEvents.length;intIndex++)
		         {
		    // 이벤트(작업)의 시작날짜를 이용해 Date객체 생성
		          var arrEventStart = arrEvents[intIndex].start.split("-");
		          var dtEventStart = new Date(arrEventStart[0],arrEventStart[1]-1,arrEventStart[2]);
		          
		          // 하단의 null비교를 위해 미리 변수 생성
		          var arrEventEnd=null;
		          var dtEventEnd=null;
		          
		          // Event의 기본 속성 외에 내가 원하는 속성 추가 가능
		          if(typeof arrEvents[intIndex].taskSeq !="undefined") {
		          // alert(arrEvents[intIndex].taskSeq); 
		          }
		          
		          // 이벤트(작업)의 종료날짜가 정의되어 있다면 해당 날짜로 Date객체 생성 
		          if(typeof arrEvents[intIndex].end != "undefined" && arrEvents[intIndex].end != null) {
		           arrEventEnd = arrEvents[intIndex].end.split("-");
		           dtEventEnd = new Date(arrEventEnd[0],arrEventEnd[1]-1,arrEventEnd[2]-1);
		          }
		          
		          // 만일 종료날짜가 null이 아니라면 선택날짜와 비교
		          // 종료일과 같거나, 시작일/종료일 사이에 위치한 작업이 있다면 Events에 저장
		          if(dtEventEnd!=null) {
		           if(dtEventEnd.getTime() == dtToday.getTime()) {
		            toDayEvents.push(arrEvents[intIndex]);
		           }
		           else if(dtToday.getTime() > dtEventStart.getTime() && dtToday.getTime() < dtEventEnd.getTime()) {
		            toDayEvents.push(arrEvents[intIndex]);
		           }
		          }
		          // 선택날짜에 해당하는 1일치 작업이 있다면 Events에 저장
		          else if(dtEventStart.getTime() == dtToday.getTime())
		          {
		           toDayEvents.push(arrEvents[intIndex]);
		          }
		          
		         }
		         alert(toDayEvents.length+"개");
		         
		         // 선택일자의 이벤트가 1개 이상이면
		         if(toDayEvents.length>0)
		         {
		          var strDataGrid = "";
		          for(var intIndex=0;intIndex<toDayEvents.length;intIndex++)
		          {
		           strDataGrid += " 작업순차번호 : " + toDayEvents[intIndex].id;
		           strDataGrid += "\n 작업명 : " + toDayEvents[intIndex].title;
		           if(typeof toDayEvents[intIndex].end != "undefined" && toDayEvents[intIndex].end != '') {
		            strDataGrid += "\n작업 시작일시 : " + toDayEvents[intIndex].start;
		            strDataGrid += "\n 작업 종료일시 : " + toDayEvents[intIndex].end;
		           }
		           else
		            strDataGrid += "\n 작업 일시 : " + toDayEvents[intIndex].start;
		           
		           if(typeof toDayEvents[intIndex].taskSeq !="undefined") {
		            strDataGrid += "\n TASK_SEQ : " + toDayEvents[intIndex].taskSeq; 
		           }
		           
		           strDataGrid += "\n\n"
		          }
		          alert(strDataGrid);
		          // 특정 div로 작업내역 기록
		          $("#dataGrid").html(strDataGrid);
		          
		          //alert(JSON.stringify(toDayEvents))
		         }
		     },
		  eventClick: function(calEvent, jsEvent, view) {
		   alert('id: ' + calEvent.id);
		         alert('이벤트: ' + calEvent.title);
		         alert('보이는 화면: ' + view.name);
		   if(calEvent.end != null && calEvent.end !="")
		   {
		          alert("작업시작일자:"+calEvent.start.format());
		          alert("작업종료일자:"+calEvent.end.format());
		   }
		   else {
		    alert("작업일자: " +calEvent.start.format());
		   }
		   
		         $(this).css('border-color', 'red');
		  }
		 });
 })
 
//}
</script>
<style type="text/css">
#calendar {
	max-width: 900px; 
	margin: 0 auto;
}
</style>
</head>
<body>
 
<div id="calendar"></div>

</body>
</html>
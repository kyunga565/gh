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
	$(function(){
		calendarEvent()
	})
	function calendarEvent(eventData){
		$("#calendar").html("")
		var date = new Date()
		var d = date.getDate()
		var m = date.getMonth()
		var y = date.getFullYear()
		var calendar = $("#calendar").fullCalendar({
			header:{left:"",
				center:"title",
				right:"today prev,next"},
			editable:true,
			titleFormat:{
				month:"yyyy년 MMMM",
				week:"[yyyy] MMM dd일 {[yyyy] MMM dd일}",
				day:"yyyy년 MMM d일 ddd"
			},
			allDayDefault:false,
			defaultValue: "month",
			editable:false,
			monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dayNames:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
			dayNamesShort: ["일","월","화","수","목","금","토"],
			buttonText:{today:"오늘",month:"월별",week:"주별",day:"일별"},
			events:eventData,
			timeFormat:"HH:mm"
		})
		
	}
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
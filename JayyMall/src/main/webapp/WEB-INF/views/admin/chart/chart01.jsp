<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!--views/chart_exam/chart01.jsp -->
 
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/plugin_js.jsp"%>
<%@include file="/WEB-INF/views/include/header2.jsp"%>
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/js/admin/order_list.js"></script>

<!-- 구글 차트 호출을 위한 js 파일 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
//구글 차트 라이브러리 로딩
//google객체는 위쪽 google src안에 들어있음
google.load('visualization','1',{
    'packages' : ['corechart']
});
//로딩이 완료되면 drawChart 함수를 호출
    google.setOnLoadCallback(drawChart); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
    function drawChart() {
        var jsonData = $.ajax({ //비동기적 방식으로 호출한다는 의미이다.
            url : "${path}/json/sampleData2.json",  // sampleData1.json
            //json에 sampleData.json파일을 불러온다.
            //확장자가 json이면 url 맵핑을 꼭 해주어야 한다. 안해주면 자바파일인줄 알고 404에러가 발생한다.
            //그렇기 때문에 servlet-context파일에서 리소스를 맵핑해준다.
            dataType : "json",
            async : false
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data
        = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        var chart = new google.visualization.PieChart(document.getElementById('chart_div')); //원형 그래프
        
        //var chart
        // = new google.visualization.LineChart(
                //document.getElementById('chart_div')); 선 그래프 
                
        //var chart
        //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                
                //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                chart.draw(data, {
                    title : "차트 예제",
                    //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                    width : 600,
                    height : 400
                });
    }
 
</script>
</head>
<body>
    
    <!-- 차트 출력 영역 -->
    <div id="chart_div"></div>
    <!-- 차트가 그려지는 영역 -->
    <!-- 차트 새로고침 버튼 -->
    <button id="btn" type="button" onclick="drawChart()">refresh</button>
</body>
</html>

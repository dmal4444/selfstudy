<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<!-- ajax library -->
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- jui_chart library -->
<script src="../src/jui_chart/lib/jquery-1.8.0.min.js"></script>
<script src="../src/jui_chart/dist/chart.js"></script>

<body>
<div style="width:2000px; height:500px;">
	<div id="scatter_result" style="width:50%; height:100%; float:left;"></div>
	<div id="bubble_result" style="width:50%; height:100%; float:left;"></div>
</div>
<div style="wdith:500px; height:500px;">
	<div id="bar_result" style="width:50%; height:100%; float:left;"></div>
	<div id="pie_result" style="width:50%; height:100%; float:left;"></div>
</div>
</body>

</script>
<script id="scatter">
var tableName = "emp";
$.ajax({
	url: '../AjaxServlet',
	data: 'tableName='+tableName,
	dataType: 'json',
	type: 'GET',
	success:function(data){
		console.log(data);
		
		var tbDataIdx=data[0][tableName]; //
		var columnName = tableName+"_column";
		//테이블 이름 알려주기
		$(".tbName").html(tableName);
		
		//columnTable에 컬럼 정보 추가하기
		//각 table에 column이름 추가하기
		for(var i=0; i<data[1][columnName].length; i++){
			var item=data[1][columnName][i];
			var name=item.name;
			var type=item.typeName;
			
			var tableCode_tbColumn=
				"<tr id='append_column'><td>"+name+"</td><td>"+type+"</td></tr>";
			$("#columnTable").append(tableCode_tbColumn);
		}
		
		var index = 1; //데이터 갯수 카운트를 위한 변수
		var tableCode_tbData = ""; // 컬럼명 추가하기 위한 변소
		
		$.each(tbDataIdx[0], function(key, value){
			tableCode_tbData +="<th id='append_columnName'>"+key+"</th>";//컬럼이름
		});
		$("#tbRow").after(tableCode_tbData);
		
		//데이터를 집어넣는다.
		$.each(tbDataIdx, function(key, value){
			var tableCode="";
			$.each(value, function(key, value){
				
				if(index == 1){
					tableCode += "<tr><td>"+value+"</td>";
					index++;
				}
				else if(index < data[1][columnName].length){
					tableCode += "<td>"+value+"</td>";
					index++;
				}
				else{
					tableCode += "<td>"+value+"</td></tr>";
					index=1;
				}
				
			});
			$("#valueTable").append(tableCode);
		});
		var chartData= "";
		if(tableName == "emp"){
			for(var i=0; i<tbDataIdx.length; i++){
				if(i == tbDataIdx.length-1){
					chartData += '{"deptno" : "'+tbDataIdx[i].DEPTNO+'", "sal" : '+tbDataIdx[i].SAL+'}]'
				}
				else if(i == 0){
					chartData += '[{"deptno" : "'+tbDataIdx[i].DEPTNO+'", "sal" : '+tbDataIdx[i].SAL+'},'
				}
				else{
					chartData += '{"deptno" : "'+tbDataIdx[i].DEPTNO+'", "sal" : '+tbDataIdx[i].SAL+'},'
				}
			}
	
		}
		
		//chart에 넣어줄 데이터를 JSON형식으로 바꾼다.
		var bar_data = JSON.parse(chartData);
		
	
		var chart = jui.include("chart.builder");
		var activeIndex = 0,
		    bardata = [
		        { quarter : "1Q", samsung : 50, lg : 35, sony: 10 },
		        { quarter : "2Q", samsung : 20, lg : 30, sony: 5 },
		        { quarter : "3Q", samsung : 20, lg : 5, sony: 10 },
		        { quarter : "4Q", samsung : 30, lg : 25, sony: 15 }
		    ];

		chart("#bar_result", {
		    axis : {
		        x : {
		            type : "range",
		            domain : function(data) {
		                return data.samsung + data.lg + data.sony;
		            },
		            line : true,
		            orient: "top"
		        },
		        y : {
		            type : "block",
		            domain : "quarter",
		            line : true
		        },
		        data : data
		    },
		    brush : {
		        type : "stackbar",
		        active : activeIndex,
		        activeEvent : "click",
		        target : [ "samsung", "lg", "sony" ]
		    },
		    widget : [{
		        type : "title",
		        text : "Bar Sample",
		        orient : "bottom",
		        align : "end"
		    }, {
		        type : "legend",
		        filter : true
		    }],
		    event : {
		        "mousedown" : function(d) {
		            activeIndex = d.dataIndex;
		        },
		        "legend.filter" : function(target) {
		            this.updateBrush(0, { active: activeIndex });
		        }
		    }
		});
				
	},
	error:function(request, status, error){
		alert(request.responseText);
	}
	
});

</script>

</html>
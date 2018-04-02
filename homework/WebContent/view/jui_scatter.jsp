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
					chartData += '{"ename" : "'+tbDataIdx[i].ENAME+'", "salary" : '+tbDataIdx[i].SAL+'}]'
				}
				else if(i == 0){
					chartData += '[{"ename" : "'+tbDataIdx[i].ENAME+'", "salary" : '+tbDataIdx[i].SAL+'},'
				}
				else{
					chartData += '{"ename" : "'+tbDataIdx[i].ENAME+'", "salary" : '+tbDataIdx[i].SAL+'},'
				}
			}
	
		}	
			
		//chart에 넣어줄 데이터를 JSON형식으로 바꾼다.
		var jsonObj = JSON.parse(chartData);

		var chart = jui.include("chart.builder");
		var time = jui.include("util.time");

		function getNumber() {
		    return Math.round(Math.random() * 30  % 20);
		}

		var start = new Date(80, 09, 17),
		end = time.add(start, time.months, 80),
		scatter_data = [];
		
		console.log("start : "+start);
		console.log("end : "+end);
		
		for(var i = 0; i < 14; i++) {
		    scatter_data.push({
		        time : new Date(data[0][tableName][i].HIREDATE),
		        sales : data[0][tableName][i].SAL,
		        name: data[0][tableName][i].ENAME
		    });		    
		    
		}
		chart("#scatter_result", {
		    padding : {
		        left : 70
		    },
		    axis : {
		        x : {
		            type : "date",
		            domain : [ start, end ],
		            interval :  1000 * 60 * 60 * 60 * 60, // 1hours
		            format : "yy-MM",
		            key: "time",
		            line : true
		        },
		        y : {
		            type : "range",
		            domain : "sales",
		            step : 10,
		            line : true
		        },
		        data : scatter_data
		    },
		    brush : {
		        type : "scatter",
		        size : 7,
		        target : ["sales"]
		    },
		    widget : [{
		        type : "title",
		        text : "Scatter Sample"
		    }, {
		        type : "cross",
		        xFormat : function(d) {
		            return time.format(d, "yy-MM");
		        },
		        yFormat : function(d) {
		            return Math.round(d);
		        }
		    }, {
		        type : "tooltip"
		    }]
		});

				
	},
	error:function(request, status, error){
		alert(request.responseText);
	}
	
});

</script>

</html>
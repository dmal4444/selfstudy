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
<div style="width:1500px; height:500px;">
	<div id="scatter_result" style="width:50%; height:100%; float:left;"></div>
	<div id="bubble_result" style="width:50%; height:100%; float:left;"></div>
</div>
<div style="wdith:500px; height:500px;">
	<div id="bar_result" style="width:50%; height:100%; float:left;"></div>
	<div id="pie_result" style="width:50%; height:100%; float:left;"></div>
</div>
</body>

<script id="ajax">
var tableName = "emp";
var num =2;
	$.ajax({
		url: '../AjaxServlet',
		data: 'tableName='+tableName+'&num='+num,
		dataType: 'json',
		type: 'GET',
		success:function(data){
			var tbDataIdx=data[0][tableName]; 
			var columnName = tableName+"_column";
						
			var chartData= "";
			if(tableName == "emp"){
				for(var i=0; i<tbDataIdx.length; i++){
					if(i == tbDataIdx.length-1){
						chartData += '{"ename" : "'+tbDataIdx[i].ENAME+'", "sal" : '+tbDataIdx[i].SAL+'}]'
					}
					else if(i == 0){
						chartData += '[{"ename" : "'+tbDataIdx[i].ENAME+'", "sal" : '+tbDataIdx[i].SAL+'},'
					}
					else{
						chartData += '{"ename" : "'+tbDataIdx[i].ENAME+'", "sal" : '+tbDataIdx[i].SAL+'},'
					}
				}
		
			}

			//chart에 넣어줄 데이터를 JSON형식으로 바꾼다.

			var chart_data=JSON.parse(chartData)
			
						
			scatter_chart(data);
			bubble_chart(chart_data);
			pie_chart(tbDataIdx);
			bar_chart(chart_data);
			
			
		},
		error:function(request, status, error){
			alert(request.responseText);
		}
		
	});
	
</script>
<script id="scatter">

function scatter_chart(data){
	var chart = jui.include("chart.builder");
	var time = jui.include("util.time");
	
	
	var start = new Date(80, 09, 17),
	end = time.add(start, time.months, 80),
	scatter_data = [];
	
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
}

</script>
<script id="bubble">
function bubble_chart(data){
	var chart = jui.include("chart.builder");
	
	chart("#bubble_result", {
	    axis : {
	        x : {
	            type : "block",
	            domain : "ename",
	            line : true
	        },
	        y : {
	            type : "range",
	            domain : [ 750, 5000 ],
	            step : 10,
	            line : true
	        },
	        data : data
	    },
	    brush : {
	        type : "bubble",
	        min : 30,
	        max : 50,
	        active : 1,
	        activeEvent : "click",
	        scaleKey : "sal",
	        target : "sal",
	        showText : true,
	        colors : [ "#ff0000" ]
	    },
	    event : {
	        click : function(data) {
	            console.log(data);
	        }
	    }
	});
}
</script>
<script id="bar">
function bar_chart(data){
	var chart = jui.include("chart.builder");
	
	chart("#bar_result", {
	    axis : [{
	        x : {
	            type : "range",
	            domain : "sal",
	            step : 10,
	            line : true
	        },
	        y : {
	            type : "block",
	            domain : "ename",
	            line : true
	        },
	        data : data
	    }],
	    brush : [{
	        type : "focus",
	        start : 8,
	        end : 8
	    }, {
	        type : "bar",
	        target : "sal",
	        display : "max",
	        active : 5,
	        activeEvent : "mouseover",
	        animate : true
	    }],
	    widget : [{
	        type : "title",
	        text : "Bar Sample",
	        align : "start"
	    }]
	});
}
</script>
<script id="pie">

function pie_chart(tbDataIdx){
		var president = 0;
		var clerk = 0;
		var salesman = 0;
		var manager = 0;
		var analyst = 0;
		
		for(var i=0; i<tbDataIdx.length; i++){
			switch(tbDataIdx[i].JOB){
			
				case "PRESIDENT":
					president++;
					break;
				case "CLERK" :
					clerk++;
					break;
				case "SALESMAN" : 
					salesman++;
					break;
				case "MANAGER" : 
					manager++;
					break;
				case "ANALYST" : 
					analyst++;
					break;
			}
		}
	
		var chart = jui.include("chart.builder");
		var names = {
		    president: "PRESIDENT",
		    salesman: "SALESMAN",
		    manager: "MANAGER",
		    analyst: "ANALYST",
		    clerk: "CLERK"
		};

		chart("#pie_result", {
		    padding : 150,
		    axis : {
		        data : [
		            { president : president, salesman : salesman, manager : manager, analyst : analyst, clerk : clerk }
		        ]
		    },
		    brush : {
		        type : "pie",
		        showText : "outer",
		        active : "ie",
		        activeEvent : "click",
		        format : function(k, v) {
		            return names[k] + ": " + v;
		        }
		    },
		    widget : [{
		        type : "title",
		        text : "Pie Sample"
		    }, {
		        type : "tooltip",
		        orient : "left",
		        format : function(data, k) {
		            return {
		                key: names[k],
		                value: data[k]
		            }
		        }
		    }, {
		        type : "legend",
		        format : function(k) {
		            return names[k];
		        }
		    }]
		});
}
</script>
</html>
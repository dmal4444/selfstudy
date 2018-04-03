<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="src/jui_chart/lib/jquery-1.8.0.min.js"></script>
<script src="src/jui_chart/dist/chart.js"></script>
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<style>
table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #ddd;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2;}

tr:hover {background-color: #ddd;}

th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #743d8f;
    color: white;
}
.tbHeader {
	background-color: #bd94d1;
}


</style>

<body>
<div align="center">ã����� ���̺� �̸��� �Է��ϼ���.<input type="text" id="tableName">
	<input type="submit" value="�˻�" id="sendBtn"></div>
	<table border ="1" align="center" width="800" id="columnTable">
		<tr><th colspan="4" class="tbHeader"><a class="tbName">TABLE</a> COLUMN ����</th></tr>
		<tr>
			<th>�÷���</th>
			<th>�÷�Ÿ��</th>
		</tr>
	</table>
	<p>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</p>
	<table border="1" align="center" width="800" id="valueTable">
		<tr id="tbRow"><th class="tbHeader" colspan="20"><a class="tbName">TABLE</a> DATA ����</th></tr>
	</table>
	
	<div style="text-align:center;width:1000px;height:500px;display:inline-block;">
		<div id="chart" style="width:100%;height:100%" ></div>
	</div>

</body>
<script>
	$(document).ready(function(){
		$("#sendBtn").click(function(){
			$("#append_column").html('');
			var tableName = $("#tableName").val();
			var num = 2;
			$.ajax({
				url: 'AjaxServlet',
				data: 'tableName='+tableName+'&num='+num,
				dataType: 'json',
				type: 'GET',
				success:function(data){
					console.log(data);
					
					var tbDataIdx=data[0][tableName]; //
					var columnName = tableName+"_column";
					//���̺� �̸� �˷��ֱ�
					$(".tbName").html(tableName);
					
					//columnTable�� �÷� ���� �߰��ϱ�
					//�� table�� column�̸� �߰��ϱ�
					for(var i=0; i<data[1][columnName].length; i++){
						var item=data[1][columnName][i];
						var name=item.name;
						var type=item.typeName;
						
						var tableCode_tbColumn=
							"<tr id='append_column'><td>"+name+"</td><td>"+type+"</td></tr>";
						$("#columnTable").append(tableCode_tbColumn);
					}
					
					var index = 1; //������ ���� ī��Ʈ�� ���� ����
					var tableCode_tbData = ""; // �÷��� �߰��ϱ� ���� ����
					
					$.each(tbDataIdx[0], function(key, value){
						tableCode_tbData +="<th id='append_columnName'>"+key+"</th>";//�÷��̸�
					});
					$("#tbRow").after(tableCode_tbData);
					
					//�����͸� ����ִ´�.
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
						
						
					//chart�� �־��� �����͸� JSON�������� �ٲ۴�.
					var jsonObj = JSON.parse(chartData);
					console.log(jsonObj);
					var chart = jui.include("chart.builder");
					
					chart("#chart", {
					    axis : [{
					        x : {
					            type : "range",
					            domain : "salary",
					            step : 10,
					            line : true
					        },
					        y : {
					            type : "block",
					            domain : "ename",
					            line : true
					        },
					        data : jsonObj
					    }],
					    brush : [{
					        type : "focus",
					        start : 8,
					        end : 8
					    }, {
					        type : "bar",
					        target : "salary",
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
						
					
				},
				error:function(request, status, error){
					alert(request.responseText);
				}
				
			});
			
		});
	});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/echarts.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.js" language="javaScript"></script>
</head>
<body>
<div id="main" style="width: 400px; height: 300px;"></div>
</body>
<script type="text/javascript">
	var data;
	$(function() {
		$.ajax({
			url : "TeacherServlet/selectsex",
			dataType : "json",
			async : false,
			success : function(dat) {
				data = dat;
				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('main'));
				option = {
						 tooltip: {
						        trigger: 'item',
						        formatter: "{a} <br/>{b}: {c} ({d}%)"
						    },
						  
					    series: [
					        {
					            name:'人数',
					            type:'pie',
					            selectedMode: 'single',
					            radius: [0, '80%'],

					            label: {
					                normal: {
					                    position: 'inner'
					                }
					            },
					            labelLine: {
					                normal: {
					                    show: false
					                }
					            },
					            data:data
					        },
					       
					    ]
					};
				myChart.setOption(option);
			}
		})
	})
</script>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<!-- container-fluid -->

<head>
<title>平安托儿所</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="css/fullcalendar.css">
<link rel="stylesheet" href="css/unicorn.main.css">
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color">
<link rel="stylesheet" href="css/mycss.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<style>
#time {
	float: right;
	margin-right: 40px;
	margin-top: 20px;
}
</style>

<body onload="startTime()">
	<div id="header">
		<h1>
			<a href="javascript:window.open('dashboard.html');">平安托儿所</a>
		</h1>
	</div>

	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">
			<li><a title="" href="#"> <i class="icon icon-user"></i> <span
					class="text">${admin.userName}</span>
			</a></li>
			<li><a title="" href="exitServlet"> <i
					class="icon icon-share-alt"></i> <span class="text">退出</span>
			</a></li>
		</ul>
	</div>

	<div id="sidebar">
		<ul>
			<li class="active"><a href="index.jsp"> <i
					class="icon icon-home"></i> <span>首页</span>
			</a></li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
					<span>校园信息</span>
			</a>
				<ul>
					<li><a href="SchoolServlet/select">校园设置</a></li>
					 <li>
                    <a href="CertificateServlet/select?wx=0">校园荣誉</a>
                </li>
					<li><a href="TeacherServlet1/select?wx=0">教师风采</a></li>
					<li><a href="HomeworkServlet/select?wx=0">幼儿作品</a></li>
					<li><a href="readyServlet/select">预约报名</a></li>
				</ul></li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
					<span>考勤管理</span>
			</a>
				<ul>
					<li><a href="testimport.html">教师考勤</a></li>
					<li><a href="MorningCheck">学生考勤</a></li>
				</ul></li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
					<span>课表管理</span>
			</a>
				<ul>
					<li><a href="lessons.jsp">课程安排</a></li>
					<li><a href="teacherlesson.jsp">课表搜索</a></li>
				</ul></li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
					<span>教务管理</span>
			</a>
				<ul>
					<li><a href="grade.jsp">年级信息管理</a></li>
					<li><a href="class.jsp">班级信息管理</a></li>
					<li><a href="stuinformation">幼儿管理</a></li>
					<li><a href="teacherpage.jsp">教师信息管理</a></li>					
				</ul></li>
			
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
					<span>收费管理</span>
			</a>
				<ul>
					<li><a href="charging.jsp">收费项目</a></li>
					<li><a href="record.jsp">收费记录</a></li>
				</ul></li>
			<li class="submenu">
				<a href="">
					<i class="icon icon-th-list"></i>
					<span>校车管理</span>
			</a>
				<ul>
					<li><a href="schoolBusMap.jsp">校车路线</a></li>
				</ul>
			</li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
					<span>日常事务管理</span>
			</a>
				<ul>
					<li><a href="activity.jsp">活动</a></li>
					<li><a href="recipe.jsp">食谱</a></li>
					<li><a href="accident.jsp">事故记录</a></li>
				</ul></li>
			
		</ul>
	</div>

	<div id="content" style="background-color: #e5e5e5">
		<div id="breadcrumb">
			<a href="" title="" class="tip-bottom"> <i class="icon-home"></i>
				首页
			</a> <a href="" class="current">控制台</a> <a href="" class="current">控制台</a>
		</div>
		<div class="container-fluid">
			<div id="time"></div>
			<iframe style="padding-top: 20px; padding-left: 20px" scrolling="no"
				height="54" frameborder="0" allowtransparency="true"
				src="http://i.tianqi.com/index.php?c=code&id=10&icon=1&num=3"></iframe>
		</div>
		<div id="main"
			style="width: 1000px; height: 400px; float: left; margin-left: 50px;"></div>
	</div>


		<script src="js/excanvas.min.js"></script>
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.ui.custom.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.flot.min.js"></script>
		<script src="js/jquery.flot.resize.min.js"></script>
		<script src="js/jquery.peity.min.js"></script>
		<script src="js/fullcalendar.min.js"></script>
		<script src="js/unicorn.js"></script>
		<script src="js/echarts.js"></script>
		<script src="js/unicorn.dashboard.js"></script>
		<script src="js/jquery-1.8.2.js"></script>
</body>
<script type="text/javascript">
	function startTime() {
		var today = new Date()
		var week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
		var year = today.getFullYear()
		var month = today.getMonth() + 1
		var date = today.getDate()
		var day = today.getDay()
		var h = today.getHours()
		var m = today.getMinutes()
		var s = today.getSeconds()
		// add a zero in front of numbers<10  
		h = checkTime(h)
		m = checkTime(m)
		s = checkTime(s)
		document.getElementById('time').innerHTML = " " + year + "年" + month
				+ "月" + date + "日  " + week[day] + "  " + h + ":" + m + ":" + s
				+ " "
		t = setTimeout('startTime()', 500)

	}

	function checkTime(i) {
		if (i < 10) {
			i = "0" + i
		}
		return i
	}
</script>
<script type="text/javascript">
var data;
	$(function() {
		$.ajax({
		
			url:"countPerson",
			dataType:"json",
			async:false,
			success:function(dat){
				data=dat;
				
				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('main'));

			 
				option = {
					    tooltip: {
					        trigger: 'item',
					        formatter: "{a} <br/>{b}: {c} ({d}%)"
					    },
					    legend: {
					        orient: 'vertical',
					        x: 'left',
					        data:data[0]
					    },
					    series: [
					        {
					            name:'年级人数',
					            type:'pie',
					            selectedMode: 'single',
					            radius: [0, '30%'],

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
					            data:data[1]
					        },
					        {
					            name:'班级人数',
					            type:'pie',
					            radius: ['40%', '55%'],
					            label: {
					                normal: {
					                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
					                    backgroundColor: '#eee',
					                    borderColor: '#aaa',
					                    borderWidth: 1,
					                    borderRadius: 4,
					                    // shadowBlur:3,
					                    // shadowOffsetX: 2,
					                    // shadowOffsetY: 2,
					                    // shadowColor: '#999',
					                    // padding: [0, 7],
					                    rich: {
					                        a: {
					                            color: '#999',
					                            lineHeight: 22,
					                            align: 'center'
					                        },
					                        // abg: {
					                        //     backgroundColor: '#333',
					                        //     width: '100%',
					                        //     align: 'right',
					                        //     height: 22,
					                        //     borderRadius: [4, 4, 0, 0]
					                        // },
					                        hr: {
					                            borderColor: '#aaa',
					                            width: '100%',
					                            borderWidth: 0.5,
					                            height: 0
					                        },
					                        b: {
					                            fontSize: 16,
					                            lineHeight: 33
					                        },
					                        per: {
					                            color: '#eee',
					                            backgroundColor: '#334455',
					                            padding: [2, 4],
					                            borderRadius: 2
					                        }
					                    }
					                }
					            },
					            data:data[2]
					        }
					    ]
					};
				

				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option);
				
			}
	
	})
	})
	// 使用刚指定的配置项和数据显示图表。
</script>

</html>
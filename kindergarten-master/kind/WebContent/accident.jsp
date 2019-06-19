<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="css/fullcalendar.css">
	<link rel="stylesheet" href="css/unicorn.main.css">
	<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color">
	<link rel="stylesheet" href="css/mycss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function getId(obj){
	var id=$(obj).parent().parent().children("td:eq(0)").text();
	$("input[ name='id' ] ").prop("value",id);
	var name=$(obj).parent().parent().children("td:eq(1)").text();
	$("input[ name='name' ] ").prop("value",name);
	var date=$(obj).parent().parent().children("td:eq(2)").text();
	$("input[ name='date' ] ").prop("value",date);
	var accident=$(obj).parent().parent().children("td:eq(3)").text();
	$("input[ name='accident' ] ").prop("value",accident);
	var dispose=$(obj).parent().parent().children("td:eq(4)").text();
	$("input[ name='dispose' ] ").prop("value",dispose);
	var inform=$(obj).parent().parent().children("td:eq(5)").text();
	$("input[ name='inform' ] ").prop("value",inform);
}
</script>
</head>
<c:if test="${listAccident==null}">
	<c:redirect url="accident"></c:redirect>
</c:if>
<body>
<div id="header">
		<h1>
			<a href="javascript:window.open('dashboard.html');">平安托儿所</a>
		</h1>
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

	<div id="style-switcher">
		<i class="icon-arrow-left icon-white"></i>
		<span>Style:</span>
		<a href="" style="background-color: #555555; border-color: #aaaaaa;"></a>
		<a href="" style="background-color: #2D2F57;"></a>
		<a href="" style="background-color: #673232;"></a>
	</div>

	<div id="content">
		<div id="breadcrumb">
			<a href="" title="Go to Home" class="tip-bottom">
				<i class="icon-home"></i> 首页</a>
			<a href="" class="current">控制台</a>
			<a href="" class="current">控制台</a>
		</div>
		<div class="bs-example" data-example-id="contextual-table">
		<table class="table table-bordered" contenteditable="true">
                  <thead>
                    <tr>
	                    <th>编号</th>
				        <th>学生名字</th>
				        <th>日期</th>
				        <th>事故</th>
	                    <th>处理方式</th>
	                    <th>通告家长</th>
	                    <th>操作</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${listAccident}" var="stu">
                    <tr class="success">
                       <td><input type='checkbox'  name="id" value="${stu.id}" >${stu.id}</td>
                       <td>${stu.name}</td>
                       <td>${stu.date}</td>
                       <td>${stu.accident }</td>
                       <td>${stu.dispose}</td>
                       <td>${stu.inform }</td> 
	                   <td>
	                     <button class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="getId(this)">修改</button>
						   <button class="btn btn-info" onclick="window.location.href='/kind_war_exploded/accidentDelete?id=${stu.id}'" data-toggle="tooltip">删除</button>
	                    <%--<a href="accidentDelete?id=${stu.id}" class="btn btn-info" data-toggle="tooltip" title="是否删除">删除</a>--%>
	                   </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<form action="accidentModification" method="post">
								        <label >编号</label>
									    <input type="text" class="form-control" name="id" value="${stu.id}" placeholder="请输入编号">
										<label >学生名字</label>
										<input type="text" class="form-control" name="name"  value="${stu.name}" placeholder="请输入学生名字">
										<label >日期</label>
										<input type="text" class="form-control" name="date"  value="${stu.date}" placeholder="请输入日期">
										<label >孩子状况</label>
										<input type="text" class="form-control" name="accident"  value="${stu.accident}" placeholder="请输入孩子状况">
										<label >处理方式</label>
										<input type="text" class="form-control" name="dispose"  value="${stu.dispose}" placeholder="请输入处理方式">
										<label >通告家长</label>
										<input type="text" class="form-control" name="inform"  value="${stu.inform}"  placeholder="请输入通告家长">
								        <div class="modal-footer">
										<input  type="submit" class="btn btn-primary"  value="提交" >
								        <button type="button" class="btn btn-default" data-dismiss="modal">取消
								       </button>
							</div>
								 </form>
							</div>
						</div>
					</div>
				</div>
  </div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-colorpicker.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.uniform.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.form_common.js"></script>
</body>
</html>
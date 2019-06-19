<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>教师列表</title>
<script src="js/jquery-3.3.1.js"></script>
		<script src="js/jquery.table2excel.js"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 教务管理 <span class="c-gray en">&gt;</span> 教师信息管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- <div class="text-c"> 
		<input type="text" class="input-text" style="width:250px" placeholder="输入姓名、编号" id="" name="">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜老师</button>
	</div> -->
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" id="all" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加老师','teacheradd.jsp','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加老师</a></span>&nbsp;<a  href="javascript:;" onclick="sex('查看比例','teachersex.jsp','400','400')" class="btn btn-primary radius">查看教师比例</a>&nbsp;<a  id="export" class="btn btn-primary radius">导出</a> </div>
	<div class="mt-20">
	<table id="aaaaaaaaa" class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="60">编号</th>
				<th width="60">姓名</th>
				<th width="60">性别</th>
				<th width="60">年龄</th>
				<th width="150">电话</th>
				<th width="150">简介</th>
				<th width="150">加入时间</th>
				<th width="60">更新时间</th>
				<th width="80">操作</th>
			</tr>
		</thead>
		<tbody>
		     <c:forEach items="${teacherall}" var="teacher" >
		     <tr class="text-c">
				<td><input type="checkbox" value="1" name=""></td>
				<td>${teacher.teacherId}</td>
				<td><u style="cursor:pointer" class="text-primary" onclick="show(${teacher.teacherId})">${teacher.name}</u></td>
				<td>${teacher.sex}</td>
				<td>${teacher.age}</td>
				<td>${teacher.phone}</td>
				<td class="text-l">${teacher.descri}</td>
				<td>${teacher.intime}</td>
				<td class="td-status">${teacher.updateTime}</td>
				<td class="td-manage"><a title="编辑" href="javascript:;" onclick="select(${teacher.teacherId})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i><a title="删除"  onclick="member_del(${teacher.teacherId})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
		     </c:forEach>
		<!-- 	<tr class="text-c">
				<td><input type="checkbox" value="1" name=""></td>
				<td>1</td>
				<td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','teachershow.jsp','10001','360','400')">张三</u></td>
				<td>男</td>
				<td>13000000000</td>
				<td>admin@mail.com</td>
				<td class="text-l">北京市 海淀区</td>
				<td>2014-6-11 11:11:42</td>
				<td class="td-status">2016</td>
				<td class="td-manage"><a title="编辑" href="javascript:;" onclick="member_edit('编辑','teacherupdate.jsp','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i><a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr> -->		
		</tbody>
	</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<!-- <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>  -->
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});		
});

$("#export").click(function() {
	$("#aaaaaaaaa").table2excel({
		type: "excel",
		escape: "false"
		//exclude: ".noExl",
		//name: "Excel Document Name",
		//filename: "myFileName",
		//exclude_img: true,
		//exclude_links: true,
		//exclude_inputs: true
	});
});

/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}

function sex(title,url,w,h){
	layer_show(title,url,w,h);
}

/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}


/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}


function show(id) {
	var  id=id;
				$.ajax({
					type: 'GET',
					url: 'TeacherServlet/selectteacher',
					data:{ id: id},
					async:false
				});	 
				member_show('老师信息展示','teachershow.jsp','10001','360','400');
}

function select(id) {
	var  id=id;
				$.ajax({
					type: 'GET',
					url: 'TeacherServlet/selectteacher',
					data:{ id: id},
					async:false
				});	 
				member_edit('修改老师信息','teacherupdate.jsp','4','','510');
}

/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(id){
	layer.confirm('确认要删除吗？',function(){
		$.ajax({
			type: 'get',
			url: 'TeacherServlet/deleteteacher',
			data:{id:id},
			async:false,
			success: function(){				
			window.location.href="TeacherServlet/showteachers";			
			},
		})
	})
}

$(function(){
	var data=[];
	$("#all").click(function() {
		var deleteAll=$("input:checkbox:gt(0):checked");
		//alert(1);
		if(deleteAll.length==0){
			alert("您没有选择数据");
		} else {
			$(deleteAll).each(function(i,obj) {
				//alert($(obj).parent().text());
				var ss=$(obj).parent().next().text();
				data.push({
					teacherId:ss
				});
			});
		} 
		$("input:checkbox:gt(0):checked").parents("tr").remove();
		var json=JSON.stringify(data);//将对象转换成字符串
		$.ajax({
			type:'get',
			url:"TeacherServlet/deleteall",
			data:{"json":json},
			async:false,
			success:function (){
		    window.location.href="TeacherServlet/showteachers";
			}
		});
	});
})
</script> 
</body>
</html>
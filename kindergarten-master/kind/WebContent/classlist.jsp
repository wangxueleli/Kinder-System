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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<title>班级列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 教务管理 <span class="c-gray en">&gt;</span> 班级信息管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" id="all" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="admin_add('添加班级','classadd.jsp','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加班级</a></span></div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">班级列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="40">编号</th>
				<th width="150">名称</th>
				<th width="90">班主任姓名</th>
				<th width="150">班级类型</th>
				<th width="90">学生数量</th>
				<th width="130">更新时间</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<%-- <c:forEach items="${classlist}" var="class" >
        	  <tr class="text-c">
                <td><input type="checkbox" name="" value=""></td>
                <td>${class.classNo}</td>
                <td>${class.name}</td>
                <td>${class.brzName}</td>
                <td>${class.classType}</td>
                <td>${class.stuNumber}</td>
                <td>${class.updateTime}</td>          
               <td class="td-manage"><a title="编辑" href="javascript:;" onclick="admin_edit('修改班级信息','classupdate.jsp','2','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="ClassServlet/deleteclass?id=${class.classNo};" onclick="admin_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
		   </c:forEach> --%>
		    <c:forEach items="${classlist}" var="classes" >
			<tr class="text-c">
				<td><input type="checkbox" value="2" name=""></td>
				 <td>${classes.classNo}</td>
                <td>${classes.name}</td>
                <td>${classes.teacher}</td>
                <td>${classes.classType}</td>
                <td>${classes.stuNumber}</td>
                <td>${classes.updateTime}</td> 
				<td class="td-manage"><a title="编辑" href="javascript:;" onclick="select(${classes.classNo})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除"  onclick="admin_del(${classes.classNo})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(id){
	layer.confirm('确认要删除吗？',function(){
		$.ajax({
			type: 'get',
			url: 'ClassServlet/deleteclass',
			data:{id:id},
			async:false,
			success: function(){				
			window.location.href="ClassServlet/showclasses";			
			},
		})
	})
}
function select(id) {
	var  id=id;
				$.ajax({
					type: 'GET',
					url: 'ClassServlet/selectclass',
					data:{ id: id},
					async:false
				});	 
				admin_edit('修改班级信息','classupdate.jsp');
}

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
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
					classNo:ss
				});
			});
		} 
		$("input:checkbox:gt(0):checked").parents("tr").remove();
		var json=JSON.stringify(data);//将对象转换成字符串
		$.ajax({
			type:'get',
			url:"ClassServlet/deleteall",
			data:{"json":json},
			async:false,
			success:function (){
		    window.location.href="ClassServlet/showclasses";
			}
		});
	});
})
</script>
</body>
</html>
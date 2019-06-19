<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>晨检记录</title>
	<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js" language="JavaScript"></script>
	<script src="js/jquery.table2excel.js"></script>
	<script src="js/unicorn.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="css/fullcalendar.css">
	<link rel="stylesheet" href="css/unicorn.main.css">
	<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color">
	<link rel="stylesheet" href="css/mycss.css">
	<link rel="stylesheet" href="css/stustyle.css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
	<base href="<%=basePath%>">
</head>
<style>
td{
	text-align:center;
}
.shuju{
	marging-top:50px;
}
.dataTables_filter{
    margin-top: -70px;
}
.dataTables_length{
 	margin-top: -70px;
}
select[size] {
    width:80px;
}
#operation{
	margin-left:20px;
	margin-top:60px;
}
 button{
	border-radius: 5px;
} 
</style>


<script type="text/javascript">
		
		$(".deleteAllstu").click(function () {
			alert(1);
		})
		
		function aaa() {
			alert(1);
		}
		function showt() 
		{ 
			 var zhezhaotf=document.getElementById("zhezhaotf"); 
			 var logintf=document.getElementById("logintf"); 
			 var addstu=document.getElementById("addstu"); 
			 var addstuclose=document.getElementById("addstuclose"); 
			  
			 addstu.onclick=function() 
			 { 
				
			  zhezhaotf.style.display="block"; 
			  logintf.style.display="block";
			  $.ajax({
					type : 'get',
					url : "NianJiFen",
					//async : false,  //同步 */
					dateType:"json",
					success : function(json) {
						 //alert(json);
						 var json=eval(json);
						  var cs=document.getElementById("classsort");
						  //cs.innerHTML+="<option value='1'>haha</option>";  
						 for(i=0;i<json.length;i++){//arryDep[i]=1:java部门
							//alert(json[i].classname);
							cs.innerHTML+="<option value="+json[i].classname+">"+json[i].classname+"</option>"; 
					} 
				}
			});
			 } 
			 addstuclose.onclick=function() 
			 { 
			  zhezhaotf.style.display="none"; 
			  logintf.style.display="none";  
			 } 
			 
			} 
		function editstu(obj){
			var no=$(obj).parent().parent().children("td:eq(0)").text();
			//alert(no);
			$(" input[ name='stuno1' ] ").prop("value",no);
			$("input[name='stuname1']").prop("value",$(obj).parent().parent().children("td:eq(1)").text());
			var sex=$(obj).parent().parent().children("td:eq(2)").text();
			$("input[type='radio'][name='sex1'][value='"+sex+"']").prop("checked",true);
			var age=$(obj).parent().parent().children("td:eq(3)").text();
			$("input[name='age1']").prop("value",age);
			var classsort1=$(obj).parent().parent().children("td:eq(4)").text();
			$("#classsort1").find("option[value='"+classsort1+"']").attr("selected",true)
			var classno1=$(obj).parent().parent().children("td:eq(5)").text();
			$("#classno1 option[value='"+classno1+"']").prop("selected",true)
			var parent=$(obj).parent().parent().children("td:eq(6)").text();
			$("input[name='parent1']").prop("value",parent);
			var phone=$(obj).parent().parent().children("td:eq(7)").text();
			$("input[name='phone1']").prop("value",phone);
			/* var feesort=$(obj).parent().parent().children("td:eq(8)").text();
			$("#feesort1 option[value='"+feesort+"']").prop("selected",true) */
			/* var address=$(obj).parent().parent().children("td:eq(9)").text();
			$("input[name='address1']").prop("value",address); */
			$('#zhezhaof').show();
			$('#loginf').show();
			$("#editstuclose").click(function(){
				$('#zhezhaof').hide();
				$('#loginf').hide();
			});
		}	
		 function show2()
		{
			 var zhezhaof=document.getElementById("zhezhaof");
			 var loginf=document.getElementById("loginf");
			 var editstu=document.getElementById("editstu");
			 var editstuclose=document.getElementById("editstuclose");

			 editstu.onclick=function()
			 {
			  zhezhaof.style.display="block";
			  loginf.style.display="block";
			 }
			 editstuclose.onclick=function()
			 {
			  zhezhaof.style.display="none";
			  loginf.style.display="none";
			 }
			}
</script>
<!-- <script type="text/javascript">
		
		$(function() {
			$.ajax({
				type : 'post',
				url : "MCformation",
				 //async : false,  //同步 */
				success : function(data) {
					/* alert(data); */
					 window.location="MCformation" 
				}
			});
		});

</script> -->
<script>
function getClassno(obj){
	var classname=obj.value;
	  $.ajax({
			type : 'get',
			url : "HuoQuClassno",
			//async : false,  //同步 */
			dateType:"json",
			data:{name:classname},
			success : function(json) {
				 //alert(json);
				 var json=eval(json);
				setTimeout(function(){
				
				  var cs=document.getElementById("classno");
				  //cs.innerHTML+="<option value='1'>haha</option>";  
				  $("#classno").html("<option value='无'>请选择</option>");
				 for(i=0;i<json.length;i++){//arryDep[i]=1:java部门
					//alert(json[i].classname);
					cs.innerHTML+="<option value="+json[i].name+">"+json[i].name+"</option>"; 
			} 
				}, 300);
		}
	});
	  $.ajax({
			type : 'get',
			url : "HuoQufeesort",
			//async : false,  //同步 */
			dateType:"json",
			data:{name:classname},
			success : function(json) {
				 //alert(json);
				 var json=eval(json);
				  var cs=document.getElementById("feesort");
				  //cs.innerHTML+="<option value='1'>haha</option>";  
				  $("#feesort").html("");
				 for(i=0;i<json.length;i++){//arryDep[i]=1:java部门
					//alert(json[i].classname);
					cs.innerHTML+="<option value="+json[i].feesort+">"+json[i].feesort+"</option>"; 
			} 
				
		}
	});
}
function getCart(obj){
	var zhezhaot=document.getElementById("zhezhaot"); 
		var logint=document.getElementById("logint"); 
		var btclose=document.getElementById("btclose"); 
	 if ($("input:checkbox[name='chefei'][value='已缴费'] ").prop("checked")) {
        	//$('#selInput').css("z-index":8);
        $.ajax({
			type : 'get',
			url : "HuoQucarno",
			//async : false,  //同步 */
			dateType:"json",
			success : function(json) {
				// alert(json);
				 var json=eval(json);
				  var cs=document.getElementById("carno");
				  $("#carno").html("<option value='无'>请选择</option>");
				  //cs.innerHTML+="<option value='1'>haha</option>";  
				 for(i=0;i<json.length;i++){//arryDep[i]=1:java部门
					//alert(json[i].classname);
					cs.innerHTML+="<option value="+json[i].id+">"+json[i].cardes+"</option>"; 
			} 
		}
	});
        	$('#zhezhaot').show();
            $('#logint').show();
           // document.getElementById("selInput").style.zIndex=33;
   }   
   btclose.onclick=function() 
		{ 
	  zhezhaot.style.display="none"; 
	  logint.style.display="none";  
		} 
   $("#tijaot").click(function(){
	   var checi=$("#carno option:selected").val();
	   $.ajax({
			type : 'post',
			url : "HuoQuche",
			 //async : false,  //同步 */
			 data:{checi1:checi},
			success : function(data) {
				 //alert(data);
			}
		});
		$('#logint').hide();
		$('#zhezhaot').hide();
	});
}
/* $(function(){
	$("#tijaot").click(function(){
		$('#logint').hide();
		$('#zhezhaot').hide();
	});
}) */
</script>
<script>
	$(function(){
		$("#tijiao").click(function(){
			$('#login').hide();
			$('#zhezhao').hide();
		});
	})
</script>
<body onload="showt();show2()">
	<div id="header">
		<h1>
			<a href="javascript:window.open('dashboard.html');">平安托儿所</a>
		</h1>
	</div>

	<%--<div id="user-nav" class="navbar navbar-inverse">--%>
		<%--<ul class="nav btn-group">--%>
			<%--<li>--%>
				<%--<a title="" href="">--%>
					<%--<i class="icon icon-user"></i>--%>
					<%--<span class="text">管理员</span>--%>
				<%--</a>--%>
			<%--</li>--%>
			<%--<li>--%>
				<%--<a title="" href="login.html">--%>
					<%--<i class="icon icon-share-alt"></i>--%>
					<%--<span class="text">退出</span>--%>
				<%--</a>--%>
			<%--</li>--%>
		<%--</ul>--%>
	<%--</div>--%>

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

	<div id="content">
		<div id="breadcrumb">
			<a href="" title="Go to Home" class="tip-bottom">
				<i class="icon-home"></i> 首页</a>
			<a href="" class="current">控制台</a>
			<a href="" class="current">控制台</a>
		</div>
		<div class="container-fluid"></div>
		<div id="operation">
			<button type="button" class="addstu" id="addstu" style="background-color: #006DCC; color:white">新增</button>
			<!-- <button type="button" class="deleteAllstu" onclick="aaa()">删除</button>
			<button type="button" class="daochu">导出</button> -->
		</div> 
		<div class="shuju">
		<table id="studentlist" class="display" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th>事件编号</th> 
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>班级类别</th>
                <th>班级编号</th>
                 <th>家长姓名</th>
                <th>家长联系方式</th>
                <!-- <th>费用类别</th> -->
                <th>家庭住址
                <th>严重程度</th>  
                <th>操作</th>  
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list }" var="stu" >
        	  <tr>
                <td>${stu.stuno}</td> 
                <td>${stu.name}</td>
                <td>${stu.sex }</td>
                <td>${stu.age }</td>
                <td>${stu.classsort }</td>
                <td>${stu.classname }</td>
                <td>${stu.parentname }</td> 
                <td>${stu.phone }</td>
                <%-- <td>${stu.feesort }</td> --%>
               <td>${stu.address }</td>
                <td>${stu.carno }</td>
               <td><a href="javascript:void(0)" onclick="editstu(this)">编辑</a>&emsp;<a href="Deletemc?id=${stu.stuno}" style="color:red">删除</a></td> 
            </tr>
        	</c:forEach>
        </tbody>
        </table>
	</div>
	 <div class="zhezhaotf" id="zhezhaotf"></div>  <!-- 新增信息 -->
  <div class="logintf" id="logintf"><button id="addstuclose">×</button> 
  		<div class="zhezhaot" id="zhezhaot"></div> 
  		<div class="logint" id="logint">
  			<button id="btclose">×</button><br>
  			<center><span style="font-size: 14px">事件等级</span></center><br>
  			<div class="checi">
  				<select id="carno" name="carno">
  					<option value="无">请选择</option>
	  				<!-- <option value="1级">1级</option>
	  				<option value="2级">2级</option>
	  				<option value="3级">3级</option> -->
  				</select>
  			</div>
  			<div class="queding">
  				<button id="tijaot" >确定</button>
  			</div>
  		</div>   
		<div class="basic-grey">
			<form action="Addmc" method="post">
				<table>
					<caption>
						<h1>
							晨检信息
						</h1>
					</caption>
						<tr>
							<td>
								<label>
									事件编号:
								</label>
							</td>
							<td>
								<input type="text" name="stuno" value=""
									disabled="disabled">
							</td>
						</tr>
						<tr>
							<td>
								<label>
									姓名:
								</label>
							</td>
							<td>
								<input type="text" name="stuname" value=""
									required>
							</td>
								</tr>
								<tr>
									<td>
										<label>
											性别:
										</label>
									</td>
									<td>
										<input type="radio" name="sex" value="男" checked="checked">男
								   		<input type="radio" name="sex" value="女" >女
									</td>
								</tr>
								<tr>
									<td>
										<label>
											年龄:
										</label>
									</td>
									<td>
										<input type="text" name="age" value=""
													required>
									</td>
								</tr>
								<tr>
									<td>
										<label>
											班级类别:
										</label>
									</td>
									<td>
										<select id="classsort" onchange="HuoQuClassno(this)" name="classsort">
											<option value="无">请选择</option>
											<!-- <option value="大班">大班</option>
											<option value="中班">中班</option>
											<option value="小班">小班</option> -->
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<label>
											班级编号:
										</label>
									</td>
									<td>
										<select id="classno" name="classno">
											<option value="无">请选择</option>
											<!-- <option value="一班">一班</option>
											<option value="二班">二班</option>
											<option value="三班">三班</option> -->
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<label>
											家长姓名:
										</label>
									</td>
									<td>
										<input type="text" name="parent" value=""
													required>
									</td>
								</tr>
								<tr>
									<td>
										<label>
											联系电话:
										</label>
									</td>
									<td>
										<input type="text" name="phone" value=""
													required>
									</td>
								</tr>
								
							 <tr>
									<td >
										<label>
											情况:
										</label>
									</td>
									<td>
										未到:<input type="checkbox" value="已缴费" name="xuefei">&emsp;
										生病:<input type="checkbox" value="已缴费" name="chifei">&emsp; 
										等级:<input type="checkbox" value="已缴费" id="chefei" name="chefei" onchange="getCart(this)">
									</td>
									
								</tr>
								<tr>
									<td>
										<label>
											住址:
										</label>
									</td>
									<td>
										<input type="text" name="address" value=""
													required>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input class="button" type="submit"  value="确定" style="background-color: #006DCC;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input class="button" type="reset"
											 value="重置">
									</td>
								</tr>
						</table>
					</form>
			</div>
  </div>  <!-- 新增结束 -->
  <!-- 编辑学生信息开始 -->
  <div class="zhezhaof" id="zhezhaof"></div> 
  <div class="loginf" id="loginf"><button id="editstuclose">×</button> 
		<div class="basic-grey">
			<form action="Editmc" method="post">
				<table>
					<caption>
						<h1>
							编辑晨检信息
						</h1>
					</caption>
						<tr>
							<td>
								<label>
									事件编号:
								</label>
							</td>
							<td>
								<input type="text" name="stuno1" value=""
									readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>
								<label>
									姓名:
								</label>
							</td>
							<td>
								<input type="text" name="stuname1" value=""
									required>
							</td>
								</tr>
								<tr>
									<td>
										<label>
											性别:
										</label>
									</td>
									<td>
										<input type="radio" name="sex1" value="男" checked="checked">男
								   		<input type="radio" name="sex1" value="女" >女
									</td>
								</tr>
								<tr>
									<td>
										<label>
											年龄:
										</label>
									</td>
									<td>
										<input type="text" name="age1" value=""
													required>
									</td>
								</tr>
								<tr>
									<td>
										<label>
											班级类别:
										</label>
									</td>
									<td>
										<select id="classsort1" onchange="HuoQuClassno(this)" name="classsort1">
											<option value="无">请选择</option>
											<option value="大班">大班</option>
											<option value="中班">中班</option>
											<option value="小班">小班</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<label>
											班级编号:
										</label>
									</td>
									<td>
										<select id="classno1" name="classno1">
											<option value="无">请选择</option>
											<option value="一班">一班</option>
											<option value="二班">二班</option>
											<option value="三班">三班</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<label>
											家长姓名:
										</label>
									</td>
									<td>
										<input type="text" name="parent1" value=""
													required>
									</td>
								</tr>
								<tr>
									<td>
										<label>
											联系电话:
										</label>
									</td>
									<td>
										<input type="text" name="phone1" value=""
													required>
									</td>
								</tr>
											
								<tr>
									<td colspan="2">
										<input class="button" type="submit"  value="确定">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input class="button" type="reset"
											 value="重置">
									</td>
								</tr>
						</table>
					</form>
			</div>
  </div> <!--  编辑学生信息结束 -->
	</div>
</body>
<script>
$(function(){
	//alert($("#studentList"));
		$("#studentlist").dataTable({
		   "iDisplayLength":10,
			"bJQueryUI": false,
			"sPaginationType": "full_numbers",
            "oLanguage": {  
                "sLengthMenu": "每页显示 _MENU_条",  
                "sZeroRecords": "没有找到符合条件的数据",  
                "sInfo": "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",  
                "sInfoEmpty": "0记录",  
                "sInfoFiltered": "(从 _MAX_ 条记录中过滤)",  
                "sSearch": "搜索：",  
                "oPaginate": {  
                    "sFirst": "首页",  
                    "sPrevious": "前一页",  
                    "sNext": "后一页",  
                    "sLast": "尾页"  
                }  
            }  

		});
	} );

$(".daochu").click(function() {
	$("#studentList").table2excel({
		// 不被导出的表格行的CSS class类
		type : "excel"   //必须放在body后面  跟加载顺序有关
	});
});
</script>
</html>
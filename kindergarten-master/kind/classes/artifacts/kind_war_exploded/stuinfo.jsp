<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>平安托儿所</title>
	<meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="css/colorpicker.css">
	<link rel="stylesheet" href="css/datepicker.css">
	<link rel="stylesheet" href="css/fullcalendar.css">
	<link rel="stylesheet" href="css/unicorn.main.css">
	<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color">
	<link rel="stylesheet" href="css/mycss.css">
	<link rel="stylesheet" href="css/stustyle.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">

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
	<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
	<base href="<%=basePath%>">

</head>
<c:if test="${list==null}">
	<c:redirect url="stuinformation"></c:redirect>
</c:if>

<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<!-- <script type="text/javascript" src="js/jquery.dataTables.js"></script> -->

<script type="text/javascript" src="js/jquery.dataTables.min.js" language="JavaScript"></script>

<script type="text/javascript" src="js/jquery.table2excel.js"></script>
<%--<!-- 跳转首页情况，就复制 -->--%>
<script type="text/javascript" src="js/unicorn.js"></script>
<script type="text/javascript">

		
		
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
					url : "classsort",
					//async : false,  //同步 */
					dateType:"json",
					success : function(json) {
						 //alert(json);
						 var json=eval(json);
						  var cs=document.getElementById("classsort");
						  $("#classsort").html("<option value='无'>请选择</option>");
						  //cs.innerHTML+="<option value='1'>haha</option>";  
						 for(i=0;i<json.length;i++){//arryDep[i]=1:java部门
							//alert(json[i].classname);
							cs.innerHTML+="<option value="+json[i].classType+">"+json[i].classType+"</option>"; 
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
		function getClassno12(obj){  //加载用
			var classname=obj;
			  $.ajax({
					type : 'get',
					url : "getClassno",
					async : false,  //同步 */
					dateType:"json",
					data:{name:classname},
					success : function(json) {
						 //alert(json);
						 var json=eval(json);
						
						  var cs=document.getElementById("classno1");
						  //cs.innerHTML+="<option value='1'>haha</option>";  
						  $("#classno1").html("<option value='无'>请选择</option>");
						 for(i=0;i<json.length;i++){//arryDep[i]=1:java部门
							//alert(json[i].classname);
							cs.innerHTML+="<option value="+json[i].name+">"+json[i].name+"</option>"; 
							} 
						}
					});
				}
		function deleteStu(id) {
			//alert(id)
			var ss=confirm("是否要删除");
			if(ss==true){
				$.get("deleteStu",{id:id},
					function(data){
						window.location.href="afterdelete";
				})
			}
		}
		function editstu(obj){
			var no=$(obj).parent().parent().children("td:eq(0)").children("input:eq(1)").val();
			//alert(no);
			$(" input[ name='stuno1' ] ").prop("value",no);
			$("input[name='stuname1']").prop("value",$(obj).parent().parent().children("td:eq(1)").text());
			var sex=$(obj).parent().parent().children("td:eq(2)").text();
			$("input[type='radio'][name='sex1'][value='"+sex+"']").prop("checked",true);
			var age=$(obj).parent().parent().children("td:eq(3)").text();
			$("input[name='age1']").prop("value",age);
			var classsort1=$(obj).parent().parent().children("td:eq(4)").text();
			$("#classsort1").find("option[value='"+classsort1+"']").attr("selected",true)
			getClassno12(classsort1);
			var classno1=$(obj).parent().parent().children("td:eq(5)").text();
			$("#classno1 option[value='"+classno1+"']").attr("selected",true)
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
	
		$(function(){
			var data11=[];
			$("#allstu11").click(function() {
				$("input:checkbox:not(:first)").prop("checked", this.checked);
			});
			$("#deleteAllstu").click(function() {
				var deleteAll=$("input:checkbox:gt(0):checked");
				//alert(1);
				if(deleteAll.length==0){
					alert("您没有选择数据");
				} else {
					$(deleteAll).each(function(i,obj) {
						//alert($(obj).parent().text());
						var ss=$(obj).next().val();
						//alert(ss);
						data11.push({
							stuno:ss
						});
						//alert(obj.value);
						//alert(deleteAll[i].value);一样的  on
					});
				 
				$("input:checkbox:gt(0):checked").parents("tr").remove();
				var json=JSON.stringify(data11);//将对象转换成字符串
				$.ajax({
					type:'get',
					url:"tableDelete",
					data:{"json":json},
					async:false,
					success:function (data1){
						//alert(1);
						alert(data1);
						window.location.href="stuinformation";
						//
						}
					});
				}
			});
		});
		
	 function show2() 
		{ 
		  $.ajax({
				type : 'get',
				url : "classsort",
				async : false,  //同步 */
				dateType:"json",
				success : function(json) {
					 //alert(json);
					 var json=eval(json);
					  var cs=document.getElementById("classsort1");
					  $("#classsort1").html("<option value='无'>请选择</option>");
					  //cs.innerHTML+="<option value='1'>haha</option>";  
					 for(i=0;i<json.length;i++){//arryDep[i]=1:java部门
						//alert(json[i].classname);
						cs.innerHTML+="<option value="+json[i].classType+">"+json[i].classType+"</option>"; 
					} 
				}
			});
		} 
</script>
<!-- <script type="text/javascript">
		
		$(function() {
			$.ajax({
				type : 'post',
				url : "stuinformation",
				 //async : false,  //同步 */
				success : function(data) {
					/* alert(data); */
					 window.location="stuinformation" 
				}
			});
		});

</script> -->
<script>
function getClassno(obj){
	var classname=obj.value;
	  $.ajax({
			type : 'get',
			url : "getClassno",
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
			url : "getfeesort",
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
			url : "getcarno",
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
			url : "getche",
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
function getClassno1(obj){
	var classname=obj.value;
	  $.ajax({
			type : 'get',
			url : "getClassno",
			//async : false,  //同步 */
			dateType:"json",
			data:{name:classname},
			success : function(json) {
				 //alert(json);
				 var json=eval(json);
				
				  var cs=document.getElementById("classno1");
				  //cs.innerHTML+="<option value='1'>haha</option>";  
				  $("#classno1").html("<option value='无'>请选择</option>");
				 for(i=0;i<json.length;i++){//arryDep[i]=1:java部门
					//alert(json[i].classname);
					cs.innerHTML+="<option value="+json[i].name+">"+json[i].name+"</option>"; 
					} 
				}
			});
		}

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
			<a href="getshouye" title="Go to Home" class="tip-bottom">
				<i class="icon-home"></i> 首页</a>
			<a href="" class="current">控制台</a>
			<a href="" class="current">控制台</a>
		</div>
		<div class="container-fluid"></div>
		<div id="operation">
			<button type="button" class="btn btn-primary" id="addstu">新&emsp;增</button>
			<button type="button" id="deleteAllstu" class="btn btn-danger">批量删除</button>
			<button type="button" id="daochu" class="btn btn-info">导&emsp;出</button>
			<!-- <button type="button" id="allchu11" class="btn btn-info">批量导入</button>
			<input type="text" name="excelru" class="input-medium search-query" style="width:120px" placeholder="请输入表格名称"> -->
		</div> 
		<div class="shuju">
		<table id="studentList" class="display" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th><input type="checkbox" id="allstu11"></th> 
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>班级类别</th>
                <th>班级编号</th>
                 <th>家长姓名</th>
                <th>家长联系方式</th>
                <!-- <th>费用类别</th> -->
               <!--  <th>家庭住址</th> -->
                <th>校车编号</th>  
                <th>操作</th>  
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list }" var="stu" >
        	  <tr>
               <td><input type='checkbox' >  <input type="hidden" value=${stu.stuno}></td> 
                <td>${stu.name}</td>
                <td>${stu.sex }</td>
                <td>${stu.age }</td>
                <td>${stu.classsort }</td>
                <td>${stu.classname }</td>
                <td>${stu.parentname }</td> 
                <td>${stu.phone }</td>
                <%-- <td>${stu.feesort }</td> --%>
               <%--  <td>${stu.address }</td> --%>
                <td>${stu.carno }</td>
              <%--  <td><a href="javascript:void(0)" onclick="editstu(this)">编辑</a>&emsp;<a href="deleteStu?id=${stu.stuno}" style="color:red">删除</a></td> --%>
               <td><a href="javascript:void(0)" onclick="editstu(this)">编辑</a>&emsp;<a href="javascript:void(0)" onclick="deleteStu(${stu.stuno})" style="color:red">删除</a></td> 
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
  			<center><span style="font-size: 14px">选择车号</span></center><br>
  			<div class="checi">
  				<select id="carno" name="carno">
  					<option value="无">请选择</option>
	  				<!-- <option value="1号车">1号车</option>
	  				<option value="2号车">2号车</option>
	  				<option value="3号车">3号车</option> -->
  				</select>
  			</div>
  			<div class="queding">
  				<button id="tijaot" >确定</button>
  			</div>
  		</div>   
		<div class="basic-grey">
			<form action="addstu" method="post">
				<table>
					<caption>
						<h1>
							添加学生信息 
						</h1>
					</caption>
						<tr>						
							<td>
								<input type="hidden" name="stuno" value=""
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
									<td >
										<input type="radio" name="sex" value="男" checked="checked">男&emsp;&emsp;&emsp;&emsp;
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
										<select id="classsort" onchange="getClassno(this)" name="classsort">
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
											费用:
										</label>
									</td>
									<td>
										学费:<input type="checkbox" value="已缴费" name="xuefei">&emsp;
										生活费:<input type="checkbox" value="已缴费" name="chifei">&emsp; 
										车费:<input type="checkbox" value="已缴费" id="chefei" name="chefei" onchange="getCart(this)">
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
										<input class="button" type="submit"  value="确定">
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
			<form action="editstu" method="post">
				<table>
					<caption>
						<h1>
							编辑学生信息
						</h1>
					</caption>
						<tr>
						<!-- 	<td>
								<label>
									学号:
								</label>
							</td> -->
							<td>
								<input type="hidden" name="stuno1" value="11"
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
										<input type="radio" name="sex1" value="男" checked="checked">男&emsp;&emsp;&emsp;&emsp;
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
										<select id="classsort1" onchange="getClassno1(this)" name="classsort1">
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
										<select id="classno1" name="classno1">
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
		$("#studentList").dataTable({
			//"aoColumnDefs": [ { "bSortable": true, "aTargets": [ 0 ] }],
			//"aaSorting": [[3,'desc']],
			   //'ordering':false,
		   "iDisplayLength":4,
			"bJQueryUI": false,
			bLengthChange:false,
			"sPaginationType": "full_numbers",
            "oLanguage": {  
                "sLengthMenu": "每页显示 _MENU_条",  
                "sZeroRecords": "没有找到符合条件的数据",  
                "sInfo": "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",  
                "sInfoEmpty": "木有记录",  
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

$("#daochu").click(function() {
	$("#studentList").table2excel({
		// 不被导出的表格行的CSS class类
		type : "excel"   //必须放在body后面  跟加载顺序有关
	});
});
$("#allchu11").click(function () {
	var shuru=$("input[name='excelru']").val();
	//alert(shuru);
	$.get("exceldao",{name:shuru},
			function(data){
				alert(data);
				if(data!="请输入正确的文件名"){
					window.location.href="stuinformation";
				}
				
		})
}) 
</script>

<!-- <script src="js/bootstrap.min.js"></script>  -->
</html>
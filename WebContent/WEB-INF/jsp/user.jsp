<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = 
			request.getScheme() + "://" + request.getServerName() 
			+ ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>客户管理-BootCRM</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>customer/list.action">BOOT客户用户管理系统 v2.0</a>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
	    <!-- 邮件通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-envelope fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-messages">
				<li>
				    <a href="#">
						<div>
							<strong>张经理</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
						</div>
						<div>今天晚上开会，讨论一下下个月工作的事...</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#">
				        <strong>查看全部消息</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul>
		</li>
		<!-- 邮件通知 end -->
		<!-- 任务通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
			    <i class="fa fa-tasks fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-tasks">
				<li>
				    <a href="#">
						<div>
							<p>
								<strong>任务 1</strong> 
								<span class="pull-right text-muted">完成40%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
									<span class="sr-only">完成40%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<p>
								<strong>任务 2</strong> 
								<span class="pull-right text-muted">完成20%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
									style="width: 20%">
									<span class="sr-only">完成20%</span>
								</div>
							</div>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#"> 
				        <strong>查看所有任务</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 任务通知 end -->
		<!-- 消息通知 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-bell fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-comment fa-fw"></i> 新回复 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-envelope fa-fw"></i> 新消息 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-tasks fa-fw"></i> 新任务 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a href="#">
						<div>
							<i class="fa fa-upload fa-fw"></i> 服务器重启 
							<span class="pull-right text-muted small">4分钟之前</span>
						</div>
				    </a>
				</li>
				<li class="divider"></li>
				<li>
				    <a class="text-center" href="#"> 
				        <strong>查看所有提醒</strong>
						<i class="fa fa-angle-right"></i>
				    </a>
				</li>
			</ul> 
		</li>
		<!-- 消息通知 end -->
		<!-- 用户信息和系统设置 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i>
				               用户：${USER_SESSION.user_name}
				    </a>
				</li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
				<li class="divider"></li>
				<li>
					<a href="${pageContext.request.contextPath }/logout.action">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		<!-- 用户信息和系统设置结束 -->
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/customer/list.action" 
				    		class="active">
				      <i class="fa fa-edit fa-fw"></i> 客户管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/toUser/list.action" 
							class="active">
				      <i class="fa fa-dashboard fa-fw" ></i> 用户管理
				    </a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 用户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">用户管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/toUser/list.action">
					
					<div class="form-group">
						<label for="userId">用户账号</label> 
						<input type="text" class="form-control" id="userCode" 
						                   value="${userCode }" name="userCode" />
					</div>
					<div class="form-group">
						<label for="userName">用户名称</label> 
						<input type="text" class="form-control" id="userName" 
						                   value="${userName }" name="userName" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newUserDialog" onclick="clearUser()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">用户信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>用户账号</th>
								<th>用户名称</th>
								<th>用户密码</th>
								<th>用户状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.user_id}</td>
									<td>${row.user_code}</td>
									<td>${row.user_name}</td>
									<td>${row.user_password}</td>
									<td>${row.user_state}</td>								   
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditDialog" onclick= "editUser(${row.user_id})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${row.user_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }/toUser/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 用户列表查询部分  end-->
</div>

<!-- 用户名，账号，密码，确认密码 -->
				
				<!-- private Integer user_id; //用户id 
				private String user_code;     //用户账号
				private String user_name;     //用户名称
				private String user_password; //用户密码
				private Integer user_state;   //用户状态
				 -->
<!-- 创建用户模态框 -->
<div class="modal fade" id="newUserDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">创建用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_customer_form">
				
					<div class="form-group">
						<label for="new_username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_username" 
								placeholder="你的名字" name="user_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_usercode" class="col-sm-2 control-label">账号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_usercode" 
								placeholder="账号" name="user_code" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="new_password" 
								placeholder="密码" name="user_password" />
							</div>
						</div>
					<div class="form-group">
						<label for="new_repassword" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="new_repassword" 
								placeholder="确认密码" onblur="checkRePassword()" name="user_repassword" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createUser()">创建用户</button>
			</div>
		</div>
	</div>
</div>

<!-- 修改客户模态框 -->
<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_user_form">
					<input type="hidden" id="edit_user_id" name="user_id"/>
					<div class="form-group">
						<label for="edit_userCode" class="col-sm-2 control-label">用户账号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_usercode" placeholder="用户账号" name="user_code" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_username" class="col-sm-2 control-label">用户姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_username" placeholder="用户姓名" name="user_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_password" class="col-sm-2 control-label">用户密码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_password" placeholder="用户密码" name="user_password" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_userstate" class="col-sm-2 control-label">用户状态</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_userstate" placeholder="用户状态" name="user_state" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateUser()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
	
	
	//清空注册用户窗口中的数据
	function clearUser() {
	   
	    $("#new_username").val("");
	    $("#new_usercode").val("");
	    $("#new_password").val("");
	    $("#new_repassword").val(""); 
	}
	
	/*
	确认密码校验
	* */
	function checkRePassword(){
		//获取密码输入
		var uPass = document.getElementById("new_password").value;
		
		//获取确认密码输入
		var uRePass = document.getElementById("new_repassword").value;
		
		//对密码输入进行校验
		if(uPass != uRePass){
			alert("对不起,两次密码不一致");
	        
			return false;
		}else{
			return true;
		}
	}
	
	// 注册用户
	function createUser() {
	
		//提交POST请求
	$.post("<%=basePath%>user/create.action", 
	$("#new_customer_form").serialize(),function(data){
	        if(data == "OK"){
	            alert("用户创建成功！");
	            window.location.reload();
	        }else{
	            alert("用户创建失败！");
	            window.location.reload();
	        }
	    });
	}

	
	// 通过id获取修改的客户信息
	function editUser(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>user/getUserById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_user_id").val(data.user_id);
	            $("#edit_usercode").val(data.user_code);
	            $("#edit_username").val(data.user_name);
	            $("#edit_password").val(data.user_password);
	            $("#edit_userstate").val(data.user_state);
	            
	        }
	    });
	}
    // 执行修改客户操作
	function updateUser() {
		$.post("<%=basePath%>user/update.action",$("#edit_user_form").serialize(),function(data){
			if(data =="OK"){
				alert("用户信息更新成功！");
				window.location.reload();
			}else{
				alert("用户信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除客户
	function deleteUser(id) {
	    if(confirm('确实要删除该客户吗?')) {
	$.post("<%=basePath%>user/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("用户删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除用户失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>

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

<title>登录页面</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">

<link href="${pageContext.request.contextPath}/css/style.css"
	   type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/boot-crm.css"
	   type=text/css rel=stylesheet>

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
	   	   
	   
<script 
	src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
</script>
<meta content="MSHTML 6.00.2600.0" name=GENERATOR>

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


<script type="text/javascript">

//清空注册用户窗口中的数据
function clearCustomer() {
   
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
$.post("<%=basePath%>register/create.action", 
$("#new_customer_form").serialize(),function(data){
        if(data == "OK"){
            alert("用户注册成功！");
            window.location.reload();
        }else{
            alert("用户注册失败！");
            window.location.reload();
        }
    });
}


//点击登录按钮
function loginform(){
	
	// 表单判断是登录账号和密码是否为空
	
	    var usercode = $("#usercode").val();
	    var password = $("#password").val();
	    if(usercode=="" || password==""){
	    	$("#message").text("账号或密码不能为空！");
	        
	    }else{//不为空
	    	choiceform.action="${pageContext.request.contextPath }/login.action";
	    }
	    
	
	
}

/* //改变form表单的提交路径
function changeform(){
	choiceform.action="${pageContext.request.contextPath }/toRegister.action";
} */



</script>

</head>
<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"
	background="${pageContext.request.contextPath}/images/rightbg.jpg">
<div ALIGN="center">
<table border="0" width="1140px" cellspacing="0" cellpadding="0"
                                                           id="table1">
	<tr>
		<td height="186"></td>
		<td></td>
	</tr>
	<tr>
   <!--<td background="${pageContext.request.contextPath}/images/rights.jpg"
		width="740" height="412">
   </td>-->
    <td 
		width="100" height="412">
   </td>
   
   <td class="login_msg" width="400"  align="center">
	 <!-- margin:0px auto; 控制当前标签居中 -->
	 <fieldset style="width: auto; margin: 0px auto;">
		  <legend>
		     <font style="font-size:15px" face="宋体">
		          	欢迎使用BOOT客户用户管理系统
		     </font>
		  </legend> 
		<font color="red">
			 <%-- 提示信息--%>
			 <span id="message">${msg}</span>
		</font>
		<%-- 提交后的位置：/WEB-INF/jsp/customer.jsp--%>
		<form action="${pageContext.request.contextPath }/login.action" 
			                     name="choiceform" method="post" >
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />
          账&nbsp;号：<input id="usercode" type="text" name="usercode" />
          <br /><br />
          密&nbsp;码：<input id="password" type="password" name="password" />
          <br /><br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <center>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" class="btn btn-default" value="登录" onclick="loginform()"/>&nbsp;
          
          <a href="#"  class="btn btn-primary"  data-toggle="modal" 
		           data-target="#newCustomerDialog" onclick="clearCustomer()">注册</a>
          </center>
		 </form>
	 </fieldset>
	</td>
	</tr>
</table>
</div>

<!-- 创建用户模态框 -->
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">注册用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_customer_form">
				<!-- 用户名，账号，密码，确认密码 -->
				
				<!-- private Integer user_id; //用户id 
				private String user_code;     //用户账号
				private String user_name;     //用户名称
				private String user_password; //用户密码
				private Integer user_state;   //用户状态
				 -->
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
				<button type="button" class="btn btn-primary" onclick="createUser()">注册用户</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="domain.Subscribe"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		   <style type="text/css">
      /*form{ position: absolute; left: 950px; top: 450px } ;index2.jpg*/
      form{ position: relative; left: 30px; top: 150px } ;
    </style>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js">
        </script>
		<title>添加部门</title> 
	 
       
 <script type="text/javascript"> 

	function modify() {
	if(xgname()){
		  var k=window.confirm("你确定注册该部门？");
		  if(k){
		    event.returnValue=true;
		    $.ajax({
			beforeSend : function() {
				$("#message").html("<img src='${pageContext.request.contextPath}/images/load.gif'/>正在保存数据...");
			},
			cache : false,
			url : '${pageContext.request.contextPath}/user/PCServlet?action=modifyResult&&id=${sr.id}', // 后台处理程序
			type : 'post', // 数据发送方式
			dataType : 'json', // 接受数据格式
			data : {//发送数据，json格式
		
				result : $("#userid").val(),

				t : $("#username").val()
			}, // 要传递的数据	
			success : function(data) {
			
				$("#message").html(data.message);
			},
			error : function(data) {			
			}		
		});
		  }
		  else{
		    event.returnValue=false;
		  }
		}
	}  
</script>
	</head>
	<body style="background:url('${pageContext.request.contextPath}/images/bg001.jpg') center no-repeat;">
		<div style="width: 100%;">
			<div style="float:left; width: 100%; border:0px ;">您好,欢迎登陆
		     <a  href=${pageContext.request.contextPath}/index.jsp>退出</a> 
		     <a href="javascript:history.go(-1);">返回上级</a>
		     <a  href=${pageContext.request.contextPath}/Doctor.jsp>医生信息</a>
			 <a  href=${pageContext.request.contextPath}/Super.jsp>部门信息</a>
			 <a  href=${pageContext.request.contextPath}/AddDepartment.jsp>添加部门</a>
			 </div>
 		</div>
		<form name="modifyform" id="modifyform"  method="post" action="${pageContext.request.contextPath}/user/PCServlet">
			<table align="center" width="500"  border="0" cellpadding="1"
				cellspacing="0">
				<tr height="30">
					<td align="center" colspan="2" id="message">
						${message}
					</td>
				</tr>
				
				
				<tr align="left" valign="middle" height="40">
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						医生编号:
					</td>
					<td>
						<input type="text" name="userid" id="userid"
							 onblur="xgname()" value="" />
						<span id="usernamemessage"></span>
					</td>
				</tr>			
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						医生名:
					</td>
					<td>
						<input type="text" name="username" id="username"
							 onblur="xgname()" value="" />
						<span id="usernamemessage"></span>
					</td>
				</tr>
				 <tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						医生编号:
					</td>
					<td>
						<input type="text" name="userid" id="userid"
							 onblur="xgname()" value="" />
						<span id="usernamemessage"></span>
					</td>
				</tr>			
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						密码:
					</td>
					<td>
						<input type="text" name="username" id="username"
							 onblur="xgname()" value="" />
						<span id="usernamemessage"></span>
					</td>
				</tr><tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						性别:
					</td>
					<td>
						<input type="text" name="userid" id="userid"
							 onblur="xgname()" value="" />
						<span id="usernamemessage"></span>
					</td>
				</tr>			
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						是否为专家:
					</td>
					<td>
						<input type="text" name="username" id="username"
							 onblur="xgname()" value="" />
						<span id="usernamemessage"></span>
					</td>
				</tr>
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						部门编号:
					</td>
					<td>
						<input type="text" name="userid" id="userid"
							 onblur="xgname()" value="" />
						<span id="usernamemessage"></span>
					</td>
				</tr>			
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						可预约人数:
					</td>
					<td>
						<input type="text" name="username" id="username"
							 onblur="xgname()" value="" />
						<span id="usernamemessage"></span>
					</td>
				</tr>
				
				<tr align="center" valign="middle" height="40">
					<td>
						<input type="button" value="注册" onclick="modify()" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
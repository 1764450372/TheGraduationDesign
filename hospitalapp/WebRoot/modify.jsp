<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="domain.Subscribe"%>
<%Subscribe Subscribe=(Subscribe)request.getAttribute("sr"); %>
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
		<title>修改</title> 
		<script language="javascript">  
     function xgname()
       {
           var unames=document.getElementById("username");
           var z=unames.value;
           var unamesmessage=document.getElementById("usernamemessage");
           
           if(z=="")
           {
           unamesmessage.innerHTML="<font color='red'>结果不能为空</font>";
           return false;
           }
           
           else
           {
            unamesmessage.innerHTML="";
           return true;
           }         
      }
      function check()
       {
        	
           var serachType=document.getElementById("serachType");
           var z=serachType.value;
         
           var c = new Array("", "胸透", "CT","肝功","血常规"); 
         
           var username=document.getElementById("username");
          
           
           username.value=c[z];     
       
      }
</script>
<script type="text/javascript"> 

	function modify() {
	if(xgname()){
		  var k=window.confirm("你确定要修改该结果");
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
		
				result : $("#username").val(),

				t : new Date()
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
			<div style="float:left; width: 100%; border:0px ;">您好,欢迎登陆  <a  href=${pageContext.request.contextPath}/index.jsp>退出</a><br></div>
		     <a href="javascript:history.go(-1);">返回上级</a>
		</div>
		<form name="modifyform" id="modifyform"  method="post" action="${pageContext.request.contextPath}/user/PCServlet">
			<table align="center" width="500" border="0" cellpadding="1"
				cellspacing="0">
				<tr height="30">
					<td align="center" colspan="2" id="message">
						${message}
					</td>
				</tr>
				
				
				<tr align="left" valign="middle" height="40">
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						编号:
					</td>
					<td>
						<label style="width:153px;">
							${sr.id}
						</label>
					</td>
				</tr>			
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						病人编号:
					</td>
					<td>
						<label style="width:153px;">
							${sr.user_id}
						</label>
					</td>
				</tr>
					<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						医生编号:
					</td>
					<td>
						<label style="width:153px;">
							${sr.doctor_id}
						</label>
					</td>
				</tr>	
				
				<Tr align="left" valign="middle" height="40">
					
					<td width="100" valign="middle">
						检查:
					</td>
					<Td colspan="8"style="text-align: left; border: none; padding: 3px;">
					    <SELECT id="serachType" name="serachType"  onchange="check()">
					   
						    <OPTION value="0"  selected></OPTION>
						    <OPTION value="1">胸透</OPTION>
					    	<OPTION value="2">CT</OPTION>
					    	<OPTION value="3">肝功</OPTION>
					     	<OPTION value="4">血常规</OPTION>
					     </SELECT>				    
					</Td>
				</Tr>
							
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						结果:
					</td>
					<td>
						<input type="text" name="username" id="username"
							 onblur="xgname()" value="${modifyUser.name}" />
						<span id="usernamemessage"></span>
					</td>
				</tr>
				<tr align="left" valign="middle" height="40">
					<td width="100" valign="middle">
						时间:
					</td>
					<td>
						<label style="width:153px;">
							${sr.datetime}
						</label>
					</td>
				</tr>
				<tr align="center" valign="middle" height="40">
					<td>
						<input type="button" value="修改完毕" onclick="modify()" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
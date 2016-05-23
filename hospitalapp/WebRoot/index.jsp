<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
      form{ position: relative; left: 30px; top: 270px} ;
    </style>
    <script type="text/javascript">
		   if(window.parent!=window)
		      window.parent.location.href="${pageContext.request.contextPath}/login.jsp";
	</script>
  </head>  
  <body  style="background:url('${pageContext.request.contextPath}/images/bg001.jpg') center no-repeat;" >
      <form  style="background:url('${pageContext.request.contextPath}/images/login_3.png') center no-repeat;"name="loginform" id="loginform" method="post" action="${pageContext.request.contextPath}/user/PCServlet">
         <table align="center">
         <tr height="30">
            </tr> 
           <tr height="30">
              <td align="center" colspan="2">            
                 ${error}
              </td>
            </tr>
            <tr height="30">
              <td align="right" width="60">用户名</td>
              <td align="left" width="260">
                 <input type="text" name="id" id="id" value="${id}"/>
              </td>
            </tr>
            <tr height="30">
              <td align="right" width="60">密　码</td>
              <td align="left" width="260">
                 <input type="password" name="pwd" id="pwd"/>
              </td>
            </tr>
            <tr height="30">
              <td align="center" colspan="2">
                 <input type="submit" value="登录"/>
              </td>
            </tr>
         </table>
         <input type="hidden" name="action" value="login" id="action"/>
         </form>
  </body>
</html>

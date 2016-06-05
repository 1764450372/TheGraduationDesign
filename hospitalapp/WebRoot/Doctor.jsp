<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="domain.Doctor"%>
<%@ page import="dao.DoctorDao"%>
<%@ page import="tools.SearchResult"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script type="text/javascript">
		
		function gotoUrl(page){
		   $("#page").val(page);
		   $("#searchform").submit();
	    }
	    function del(id){ 
	      var k=window.confirm("你确定要删除该医生吗？");
	      
          if(k){
               
               event.returnValue=true;
               window.location.href="${pageContext.request.contextPath}/user/PCServlet?action=delectDpartment&id="+id;
               } 
          else{
    		   event.returnValue=false;
 			   }     
	    }
	    
	   </script>
	 <style type="text/css">
   
					.specail_table{border:0 }
    </style>
	  
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchUI.css" type="text/css"></link>
       
	</head>
	<body style="background:url('${pageContext.request.contextPath}/images/bg001.jpg') center no-repeat;">			
	    <div style="width: 100%;">
			<div style="float:left; width: 100%; border:0px ;">您好,欢迎登陆 
			 <a href="javascript:history.go(-1);">返回上级</a>
			 <a  href=${pageContext.request.contextPath}/Super.jsp>部门信息</a>
			 <a  href=${pageContext.request.contextPath}/AddDepartment.jsp>添加部门</a>
			 <a  href=${pageContext.request.contextPath}/AddDoctor.jsp>添加医生</a>
			<br></div>
		</div>
		<form name="searchform" id="searchform" method="post"
			action="${pageContext.request.contextPath}/user/PCServlet">
			<table align="center" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse;">
				<Tr height="25" align="center" bgcolor="#cccccc">
					<Td width="100">医生编号</Td>
					<Td width="100">医生名</Td> 
             	    <Td width="50">操作</Td>
			   </Tr>
			   <%DoctorDao doctorDao = new DoctorDao();
  					SearchResult<Doctor> sr = doctorDao.queryA(10,1000);
                  //List<Doctor> list = sr.getList();
                  List<Doctor> list = doctorDao.queryAllDoctor();
                  for(int i=0;list!=null&&i<list.size();i++){
                    Doctor doctor=list.get(i);
               %>
               <Tr height="25" align="center">
                    <Td><%=doctor.getId() %></Td>
					<Td><%=doctor.getName() %></Td>
					<td>
	             	
              	    <input type="button" value="删除" onclick="del('<%=doctor.getId()%>')"/>
 	             		
	             	</td>
	             </Tr>	
	         <%}%>
			  </table>
			<input type="hidden" name="action" value="search" />
		
		</form>
	</body>
</html>

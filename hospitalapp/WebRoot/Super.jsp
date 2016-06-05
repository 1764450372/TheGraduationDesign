<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="domain.Department"%>
<%@ page import="tools.SearchResult"%>
<%@ page import="dao.DepartmentDao"%>


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
	      var k=window.confirm("你确定要删除该部门吗？");
	      
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
	    <%Department loginuser=(Department)session.getAttribute("sr"); %>
	 					
	    <div style="width: 100%;">
			<div style="float:left; width: 100%; border:0px ;">您好,欢迎登陆 
			 <a  href=${pageContext.request.contextPath}/index.jsp>退出</a>
			 <a  href=${pageContext.request.contextPath}/AddDepartment.jsp>添加部门</a>
			 <a  href=${pageContext.request.contextPath}/Doctor.jsp>医生信息</a>
			 <a  href=${pageContext.request.contextPath}/AddDoctor.jsp>添加医生</a>
 			 <br></div>
		</div>
		<form name="searchform" id="searchform" method="post"
			action="${pageContext.request.contextPath}/user/PCServlet">
			<table align="center" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse;">
				<Tr height="25" align="center" bgcolor="#cccccc">
					<Td width="100">部门编号</Td>
					<Td width="100">部门名</Td> 
             	    <Td width="50">操作</Td>
			   </Tr>
			   <%
			   	DepartmentDao departmentDao = new DepartmentDao();
 					SearchResult<Department> sr = departmentDao.queryAll(
							100, 1000);
                    List<Department> list=sr.getList();
                 for(int i=0;list!=null&&i<list.size();i++){
                    Department department=list.get(i);
               %>
               <Tr height="25" align="center">
                    <Td><%=department.getId() %></Td>
					<Td><%=department.getName() %></Td>
					<td>
	             	
              	    <input type="button" value="删除" onclick="del('<%=department.getId()%>')"/>
 	             		
	             	</td>
	             </Tr>	
	         <%}%>
			  </table>
			 
			<input type="hidden" name="action" value="search" />
		
		</form>
	</body>
</html>

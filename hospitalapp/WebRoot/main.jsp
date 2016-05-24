<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="domain.Subscribe"%>
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
	      var k=window.confirm("你确定要更改病志么");
	      
          if(k){
               
               event.returnValue=true;
               window.location.href="${pageContext.request.contextPath}/user/PCServlet?action=modify&id="+id;
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
       
	
	<body style="background:url('${pageContext.request.contextPath}/images/bg001.jpg') center no-repeat;">
	    <%Subscribe loginuser=(Subscribe)session.getAttribute("sr"); %>
	 					
	    <div style="width: 100%;">
			<div style="float:left; width: 100%; border:0px ;">您好,欢迎登陆  <a  href=${pageContext.request.contextPath}/index.jsp ;>退出</a><br></div>
		</div>
		<form name="searchform" id="searchform" method="post"
			action="${pageContext.request.contextPath}/user/PCServlet">
			<table align="center" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse;">
				<Tr height="25" align="center" bgcolor="#cccccc">
					<Td width="100">编号</Td>
					<Td width="100">病人编号</Td>
					<Td width="50">医生编号</Td>
					<Td width="100">是否就诊(0 未就诊  1已就诊)</Td>
					<Td width="150">时间</Td>
             	    <Td width="50">操作</Td>
  
			   </Tr>
			   <%SearchResult<Subscribe> sr=(SearchResult<Subscribe>)request.getAttribute("sr"); 
                   List<Subscribe> list=sr.getList();
                 for(int i=0;list!=null&&i<list.size();i++){
                    Subscribe Subscribe=list.get(i);
               %>
               <Tr height="25" align="center">
                    <Td><%=Subscribe.getId() %></Td>
					<Td><%=Subscribe.getUser_id() %></Td>
					<Td><%=Subscribe.getDoctor_id() %></Td>
					<Td><%=Subscribe.getDifferent() %></Td>
					<Td><%=Subscribe.getDatetime() %></Td>
	             	<td>
	             	
	             	<%if(Subscribe.getDifferent().equals("0")){ %>
             	    <input type="button" value="更改" onclick="del('<%=Subscribe.getId()%>')"/>
               		 <%} %>
	             		
	             	</td>
	             </Tr>	
	         <%}%>
			  </table>
			  <table align="center" width="500">
				<tr>
					<td  style="border: none;">
						<div class="page">
							<%if(sr.getNowpage()==1)
						            	  out.println("首页");
						                else{
		             		%>
								<a href="#" onclick="gotoUrl(<%=1%>);">首页</a>
							<%} %>
						</div>
						<div class="page">
							<%if(sr.getNowpage()==1)
		                               out.println("上一页");
							          else{
							%>
 									<a href="#" onclick="gotoUrl(<%=sr.getNowpage()-1%>);">上一页</a>
							<%} %>
						</div>
						<%
				          int totalcount=sr.getTotalcount();
				          int totalpage=(int)Math.ceil(totalcount*1.0/10);
				          for(int i=1;i<=totalpage;i++){
				          
				          if(i>=(sr.getNowpage()-4)&&i<=(sr.getNowpage()+4))
				          {			          
		        		%>
						<div class="page">
							<%
							if(sr.getNowpage()==i)
						            	  out.println(i);
						                else{
		             		%>
							<a href="#" onclick="gotoUrl(<%=i%>);"><%=i%></a>
							<%} %>
						</div>
				<% ;}}%>
						<div class="page">
							<%if(sr.getNowpage()==totalpage)
							            out.println("下一页");
							          else{
		        %>
								<a href="#" onclick="gotoUrl(<%=sr.getNowpage()+1%>);">下一页</a>
							<%} %>
						</div>
						
						
						<div class="page">
							<%if(sr.getNowpage()==totalpage)
						            	  out.println("尾页");
						                else{
		             		%>
		             		<a href="#" onclick="gotoUrl(<%=totalpage%>);">尾页</a>
							<%} %>
						</div>
						<div class="page" style="border: none; padding: 0px">
                                                                             共<%=totalpage%>页  回车跳转
							<input type="text" name="page" id="page"
								style="width: 20px; height: 20px; margin: 0px;"
								value="${sr.nowpage}" onkeyup="value=value.replace(/[^(\d)]/g,'')" onchange="if(parseInt(this.value)><%=totalpage%>||parseInt(this.value)==<%=0%> )this.value='${sr.nowpage}';" />
						</div>
					</td>
				</tr>
			</table>
			<input type="hidden" name="action" value="search" />
		
		</form>
	</body>
</html>

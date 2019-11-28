<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "board.suggestDAO"%>
<%@ page import = "board.suggest"%>
<%@ page import = "java.util.ArrayList"%> 		

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>�Խ���</title>
<%
   //User user = new User();//generate user
   String userid = (String) session.getAttribute("id");
   //String useridd= (String) session.setAttribute("userid");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
   String ifmanager = (String) session.getAttribute("ifmanager"); 
%>
</head>

<style type="text/css">
<%@include file ="/view/CSS/mainUI.css"%>
<%@include file ="/view/CSS/home.css"%>
</style>


<body>
	<p style="text-align: center;">
		<img src="/iSpace/view/Image/mainlogo.png"
			style="width: 400px; height: 80px; padding-top: 3px;">
	</p>
	
      <h5 style="text-align: right;">
         <b><%=userid%> <%=name%> ��</b>, <img
            src="/iSpace/view/Image/reportimg.png"
            style="width: 20px; height: 20px;"> �Ű�<%=report%>ȸ 
         <img src="/iSpace/view/Image/reportimg.png"
            style="width: 20px; height: 20px;">
      </h5>
      
     <div align="center">
		<nav id="topMenu">
			<ul><% if(userid!=null) {%>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/home.jsp">SEAT </a></li>
				<%}else{ %>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/mainUI.jsp">SEAT </a></li>
				<%} %>
				<li>|</li>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>

				<li>|</li>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/suggest.jsp">SUGGEST
				</a></li>

				<li>|</li>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>
			</ul>
		</nav>
	</div>
	

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
						<th style="background-color: #eeeeee; text-align: center;">����</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
					</tr>
				</thead>
				
				
				<tbody>
					<%
						int pageNumber = 1; //�⺻ ������ �ѹ�
						//�������ѹ����� ������
						if (request.getParameter("pageNumber") != null) {
							pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
						}
						
						suggestDAO suggest = new suggestDAO();
						ArrayList<suggest> list = suggest.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					
					<tr>
						<td><%=list.get(i).getSuggestId()%></td>
						<td><a
							href="viewSuggest.jsp?suggestId=<%=list.get(i).getSuggestId()%>">
							<%=list.get(i).getSuggestTitle()%></a></td>
						<td><%=list.get(i).getUserId()%></td>
						<td><%=list.get(i).getSuggestDate().substring(0, 11)%></td>
					</tr>
					<%
						}
					%>
					
				</tbody>
			</table>

			<%
				if (pageNumber != 1) {
			%>
			<a href="suggest.jsp?pageNumber=<%=pageNumber - 1%>" class= "btn btn-success btn-arraw-left">����</a>
			<%
				}
				if (suggest.nextPage(pageNumber + 1)) {
			%>
			<a href="suggest.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">����</a>>
			<%
				}
			%>

		</div>
	</div>

		<!-- ȸ�����Ѿ���� -->
	<%
		//if logined userID��� ������ �ش� ���̵� ���� if not null

		if (userid != null) {
	%>
	<a href="writeSuggest.jsp" class="btn btn-primary pull-right">�۾���</a>
	<%
		} else {
	%>
	<button class="btn btn-primary pull-right"
		onclick="if(confirm('�α��� �ϼ���'))location.href='mainUI.jsp';"
		type="button">�۾���</button>
	<%
		}
	%>
				
	</ul>
	</div>
</body>
</html>

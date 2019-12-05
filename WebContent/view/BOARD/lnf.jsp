<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "board.lnfDAO"%>
<%@ page import = "board.lnf"%>
<%@ page import = "java.util.ArrayList"%> 		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<title>�нǹ�����</title>
<%
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
%>
</head>

<style type="text/css">
<%@include file="/view/CSS/board.css"%>
</style>

<body>

	<div id='top'>
		<p style="text-align: left; margin-top: 10px; margin-left: 20%;">
			<img src="/iSpace/view/Image/mainlogo.png" style="width: 300px;">
		</p>

		<div align="center" >
			<nav id="topMenu">
				<ul>
				<li style="width: 20%">&nbsp;</li>
				
					<% if(userid!=null) {%>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/home.jsp">SEAT </a></li>
				<%}else{ %>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/mainUI.jsp">SEAT </a></li>
				<%} %>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>


				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/suggest.jsp">SUGGEST
				</a></li>


				<li class="topMenuLi" style="background-color: #df633a;">
				<a class="menuLink" style="color:white;" href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>

            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/commu.jsp">COMMUNITY </a></li>
			<li style="width: 20%;">&nbsp;</li>
			
				</ul>
			</nav>
		</div>
	</div>
		<div id='containn'>
		<div id='box-left'>'</div>

		<div id='box-center'>

 <div class="container" style= "padding-top:50px; width : 100%;" >
		<div class="row">
			<table class="table table-hover"
				style="text-align: center; border: 1px solid #eeeeee">
				<thead>
					<tr>
						<th colspan="4"
							style="background-color: white; text-align: center; font-size: 25px;">�нǹ�����</th>
					</tr>
				</thead>

					<tr>
						<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
						<th style="background-color: #eeeeee; text-align: center;">����</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
					</tr>

				<tbody>
					<%
						int pageNumber = 1; //�⺻ ������ �ѹ�
						//�������ѹ����� ������
						if (request.getParameter("pageNumber") != null) {
							pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
						}
					%>

					<%
						lnfDAO lnf = new lnfDAO();
						ArrayList<lnf> list = lnf.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getLnfId()%></td>
						<td><a href="viewLnf.jsp?lnfId=<%=list.get(i).getLnfId()%>">
								<%=list.get(i).getLnfTitle()%></a></td>
						<td>������</td>
						<%-- <td><%=list.get(i).getUserId()%></td> --%>
						<td><%=list.get(i).getLnfDate().substring(0, 11)%></td>

					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			
			<!-- ȸ�����Ѿ���� -->
			<%
				if (userid != null) {
			%>
			
			<a href="writeLnf.jsp" class="btn btn-primary pull-right">�۾���</a>
			
			<%
				} else {
			%>
			<button class="btn btn-primary pull-right"
				onclick="if(confirm('�α��� �ϼ���'))location.href='/iSpace/view/mainUI.jsp';"
				type="button">�۾���</button>			
				<%
				}
			%>

			<%
				if (pageNumber != 1) {
			%>
			<a href="lnf.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">����</a>
			<%
				}
				if (lnf.nextPage(pageNumber + 1)) {
			%>
			<a href="lnf.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">����</a>>
			<%
				}
			%>

		</div>
	</div>
		</div>
		<div id='box-right'>
			<div class="myloginarea">
				<%
				if(userid != null)
				{
				%>
				<%=userid %> <%=name %>��, ȯ���մϴ�. | <a href="/iSpace/view/logout.jsp" style="text-decoration: none; color: gray;"> �α׾ƿ� </a>		
				<% }%>			
</div>
		</div>
	</div>
   

</body>
</html>

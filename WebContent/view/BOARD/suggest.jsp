<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "board.suggestDAO"%>
<%@ page import = "board.suggest"%>
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
<title>건의 게시판</title>
<%
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
   String ifmanager = (String) session.getAttribute("ifmanager"); 
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

				<li class="topMenuLi" style="background-color: #df633a;">
				<a class="menuLink" style="color:white;" href="/iSpace/view/BOARD/suggest.jsp">SUGGEST
				</a></li>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>

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
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
				
						<tr>
							<th colspan="4"
								style="background-color: white; text-align: center; font-size:25px;">건의 게시판</th>
						</tr>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
					
				<tbody>
					<%
						int pageNumber = 1; //기본 페이지 넘버
						//페이지넘버값이 있을때
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
				<!-- 회원만넘어가도록 -->
	<%
		if (userid != null) {
	%>
	
	<a href="writeSuggest.jsp" class="btn btn-primary pull-right">글쓰기</a>
	
	<%
		} else {
	%>
	<button class="btn btn-primary pull-right"
		onclick="if(confirm('로그인 하세요'))location.href='/iSpace/view/mainUI.jsp';"
		type="button">글쓰기</button>
	<%
		}
	%>
	
			<%
				if (pageNumber != 1) {
			%>
			<a href="suggest.jsp?pageNumber=<%=pageNumber - 1%>" class= "btn btn-success btn-arraw-left">이전</a>
			<%
				}
				if (suggest.nextPage(pageNumber + 1)) {
			%>
			<a href="suggest.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a>>
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
				<%=userid %> <%=name %>님, 환영합니다. | <a href="/iSpace/view/logout.jsp" style="text-decoration: none; color: gray;"> 로그아웃 </a>		
				<% }%>				</div>
		</div>
	</div>
   
</body>
</html>

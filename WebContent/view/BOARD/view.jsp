<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.notice"%>
<%@ page import="board.noticeDAO"%>

<%
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<title>공지사항 view</title>
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

				<li class="topMenuLi" style="background-color: #df633a;">
				<a class="menuLink" style="color:white;" href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>


				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/suggest.jsp">SUGGEST
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


	<%
   /*      //로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
			String userid = null;
			if (session.getAttribute("userId") != null) {
				userid = (String) session.getAttribute("userId");
		
			}  */
		int noticeId = 0; //지워진 글인지 판단하기위해

		if (request.getParameter("noticeId") != null) {
			noticeId = Integer.parseInt(request.getParameter("noticeId"));
			System.out.println("view.jsp noticeId: "+noticeId);
		}

		if (noticeId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'notice.jsp'");
			script.println("</script>");

		}
		 session.setAttribute("noticeId",request.getParameter("noticeId"));

		notice notice = new noticeDAO().getNotice(noticeId);
	%>


	<!-- 게시판 -->
  <div class="container" style= "padding-top:50px; width : 100%;" >
		<div class="row">
			<table class="table table-bordered"
				style="text-align: center; border: 1px solid #eeeeee">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: white; text-align: center; font-size:25px;">공지사항 </th>

						</tr>
					</thead>
					<tbody>

						<tr>
							<td style="width: 20%; text-align: center"> 글 제목 </td>
							<td colspan="2"><%=notice.getNoticeTitle()%></td>
						</tr>
						
						<tr>
							<td style="text-align: center"> 작성자</td>	
							<td colspan="2"><%= notice.getUserId() %></td>

						</tr>
						
						<tr>
						
							<td style="text-align: center">작성일</td>	
							<td colspan="2"><%= notice.getNoticeDate().substring(0, 11)%></td>
						</tr>
						
						<tr>						
						<td style="text-align: center">내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=notice.getNoticeContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
					.replaceAll(">", "&gt;").replaceAll("\n", "<br/>")%></td>
					</tr>
					</tbody>
				</table>	
				
				<a href = "notice.jsp" class="btn btn-primary pull-right">목록</a>
			
				<%
				//글작성자 본인일시 수정 삭제 가능 
					if(userid != null && userid.equals(notice.getUserId())){
				%>

			 <a href="Update.jsp?noticeId=<%=noticeId%>" class="btn btn-primary pull-right">수정</a>
			
			<a onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="deleteAction.jsp?bbsID=<%=noticeId%>" class="btn btn-primary pull-right">삭제</a>

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
   
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>




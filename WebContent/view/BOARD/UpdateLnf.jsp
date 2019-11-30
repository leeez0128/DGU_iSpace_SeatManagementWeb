<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.lnf"%>
<%@ page import="board.lnfDAO"%>
<%@ page import="javax.servlet.*" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<!-- 세션 유지를 위해  -->
<%
   //User user = new User();//generate user
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
/* String lnfId = (String) session.getAttribute("lnfId"); */
 %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>

	<%
		int lnfId = 0;

		if (session.getAttribute("lnfId") != null) {
			lnfId = Integer.parseInt(request.getParameter("lnfId"));
			System.out.println("UpdateLnf.jsp lnfId : "+lnfId);
		}

		lnf lnf = new lnfDAO().getLnf(lnfId);
		/* HttpSession session = request.getSession();
		 */		
	%>
	
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>

			<a class="navbar-brand" href="lnf.jsp">JSP 게시판</a>

		</div>

		<!-- <div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">
				<li><a href="mainUI.jsp">메인</a></li>
				<li class="active"><a href="notice.jsp">게시판</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
		</div> -->
	</nav>

	<!-- 게시판 -->

	<div class="container">
		<div class="row">
			<form action="/iSpace/UpdateService" method="post"
      enctype="multipart/form-data">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
					
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">
							글 수정
							</th>
						</tr>
					</thead>
					<tbody>
					
						<tr>

							<td colspan="2"><input type="text" class="form-control"
								placeholder="글 제목" name="lnfTitle" maxlength="50"
								value="<%= lnf.getLnfTitle() %>"></td>
						</tr>
						<tr>
							<td>현재 첨부된 파일</td>
							<td><img style="width:200px;" src="/iSpace/upload/<%=lnf.getLnfFile()%>"></td>
						</tr>
						<tr>	
							<td colspan="2"><input type="file" value="파일 선택" name="lnfFile"/>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="lnfContent" maxlength="2048" style="height: 350px;"><%= lnf.getLnfContent() %></textarea>
									</td>
						</tr>
						
					</tbody>
				</table>

				<input type="submit" class="btn btn-primary pull-right" value="글수정">
			</form>
		</div>
	</div>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>



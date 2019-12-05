<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "board.commuDAO"%>
<%@ page import = "board.commu"%>
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

<title>Ŀ�´�Ƽ�Խ���</title>
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
<%@include file ="/view/CSS/mainUI.css"%>
</style>


<body>
   <p style="text-align: center;">
      <img src="/iSpace/view/Image/mainlogo.png"
         style="width: 400px;padding-top: 18px;">
   </p>

   <div class="myloginarea">
      <%=userid%> <%=name%> ��, ȯ���մϴ�. | <a href="/iSpace/view/logout.jsp"
         style="text-decoration: none; color: gray;"> �α׾ƿ� </a>
   </div>
      
<div align="center">
      <nav id="topMenu" style="padding-top:26px;">
         <ul><% if(userid!=null) {%>
            <li class="topMenuLi"><a class="menuLink" href="/iSpace/view/home.jsp">SEAT </a></li>
            <%}else{ %>
            <li class="topMenuLi"><a class="menuLink" href="/iSpace/view/mainUI.jsp">SEAT </a></li>
            <%} %>
            <li>|</li>


            <li class="topMenuLi">
            <a class="menuLink" href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>

            <li>|</li>

            <li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/suggest.jsp">SUGGEST
            </a></li>

            <li>|</li>

            <li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>
            <li>|</li>

            <li class="topMenuLi" style="background-color: #df633a;"><a class="menuLink" style="color:white;" 
               href="/iSpace/view/BOARD/commu.jsp">COMMUNITY </a></li>
         </ul>
      </nav>
   </div>
   
   
   <div class="container" style= "padding-top:100px; width : 980px;" >
      <div class="row" >
         <table class="table table-striped"
            style="text-align: center; border: 1px solid #eeeeee">
            <thead>
               <tr>
                  <th colspan="4"
                     style="background-color: white; text-align: center; font-size: 25px;">Ŀ�´�Ƽ</th>
               </tr>

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
               %>

               <%
                  commuDAO commu = new commuDAO();
                  ArrayList<commu> list = commu.getList(pageNumber);
                  for (int i = 0; i < list.size(); i++) {
               %>
               

               <tr>
                  <td><%=list.get(i).getCommuId()%></td>
                  
                  <td><a
                     href="viewCommu.jsp?commuId=<%=list.get(i).getCommuId()%>">
                     <%=list.get(i).getCommuTitle()%></a></td>
                     <td>������</td>
                  <%-- <td><%=list.get(i).getUserId()%></td> --%>
                      <td><%=list.get(i).getCommuDate().substring(0, 11)%></td>

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
         <a href="/iSpace/view/BOARD/writeCommu.jsp" class="btn btn-primary pull-right">�۾���</a>
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
         <a href="commu.jsp?pageNumber=<%=pageNumber - 1%>" class= "btn btn-success btn-arraw-left">����</a>
         <%
            }
            if (commu.nextPage(pageNumber + 1)) {
         %>
         <a href="commu.jsp?pageNumber=<%=pageNumber + 1%>"
            class="btn btn-success btn-arraw-left">����</a>>
         <%
            }
         %>

      </div>
   </div>

</body>
</html>
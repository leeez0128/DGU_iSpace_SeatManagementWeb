<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.PageManage"%>
<%@ page import="model.DateCheck"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "board.noticeDAO"%>
<%@ page import = "board.notice"%>
<%@ page import = "java.util.ArrayList"%>       

<jsp:useBean id="colorBean" class="model.ColorBean" />
<jsp:setProperty name="colorBean" property="*" />

<%
   DateCheck datecheck = DateCheck.getInstance();
   datecheck.dateCheck();
   PageManage dao = PageManage.getInstance();
   dao.seatColor(colorBean);
   ArrayList<String> color = (ArrayList<String>) colorBean.getColorList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>mainUI</title>
<style>
<%@include file="/view/CSS/mainUI.css"%>
</style>
</head>
<body>
   <p style="text-align: center;">
      <a href="/iSpace/view/mainUI.jsp"><img
         src="/iSpace/view/Image/mainlogo.png"
         style="width: 400px; height: 80px; padding-top: 3px;"></a>
   </p>



<div align="center">
      <nav id="topMenu">
         <ul>
            <li class="topMenuLi" style="background-color: #df633a;">
            <a class="menuLink" style="color:white;"
               href="/iSpace/view/home.jsp">SEAT </a></li>


            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>


            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/suggest.jsp">SUGGEST </a></li>


            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>
   
            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/commu.jsp">COMMUNITY </a></li>
         </ul>
      </nav>
   </div>






   <div class="frame">
   <div class="seatinfo">
   <img src="/iSpace/view/Image/avail.png" style="width:20px;">&nbsp이용가능
   <img src="/iSpace/view/Image/unavail.png" style="width:20px;">&nbsp이용불가 
   <img src="/iSpace/view/Image/absence.png" style="width:20px;">&nbsp부재
   </div>
      <div class="whitebox" id="seat"
         style="width: 700px; height: 460px; margin-left: 10px;">

         <p style="text-align: center;">


         <!--        시설      -->
            <button value="3DLAB" name="room"
               style="color: black; background: skyblue; position: absolute; left: 40px; top: 10px; height: 100px; width: 30px;">
               3<br>D<br>L<br>A<br>B
            </button>

            <!-- <form action="/iSpace/Facility" method="post">   -->
            <button value="seminar1" id="seminar1" name="room1"
               style="color: black; background: skyblue; height: 100px; position: absolute; left: 40px; top: 130px; width: 30px;">
               세<br>미<br>나<br>실<br>1
            </button>
            <!-- </form>
        <form action="/iSpace/Facility" method="post">  -->
            <button value="seminar2" id="seminar2" name="room2"
               style="color: black; background: skyblue; height: 100px; position: absolute; left: 40px; top: 250px; width: 30px;">
               세<br>미<br>나<br>실<br>2
            </button>


            <input type="button" onclick="javascript:seatbtn()" value="1"
               style="color: black; background: <%=color.get(0)%>; height: 30px; position: absolute; left: 120px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="2"
               style="color: black; background: <%=color.get(1)%>; height: 30px; position: absolute; left: 150px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="3"
               style="color: black; background: <%=color.get(2)%>; height: 30px; position: absolute; left: 195px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="4"
               style="color: black; background: <%=color.get(3)%>; height: 30px; position: absolute; left: 225px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="5"
               style="color: black; background: <%=color.get(4)%>; height: 30px; position: absolute; left: 255px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="6"
               style="color: black; background: <%=color.get(5)%>; height: 30px; position: absolute; left: 285px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="7"
               style="color: black; background: <%=color.get(6)%>; height: 30px; position: absolute; left: 330px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="8"
               style="color: black; background: <%=color.get(7)%>; height: 30px; position: absolute; left: 360px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="9"
               style="color: black; background: <%=color.get(8)%>; height: 30px; position: absolute; left: 390px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="10"
               style="color: black; background: <%=color.get(9)%>; height: 30px; position: absolute; left: 420px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="11"
               style="color: black; background: <%=color.get(10)%>; height: 30px; position: absolute; left: 450px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="12"
               style="color: black; background: <%=color.get(11)%>; height: 30px; position: absolute; left: 480px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="13"
               style="color: black; background: <%=color.get(12)%>; height: 30px; position: absolute; left: 510px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="14"
               style="color: black; background: <%=color.get(13)%>; height: 30px; position: absolute; left: 540px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="15"
               style="color: black; background: <%=color.get(14)%>; height: 30px; position: absolute; left: 585px; top: 10px; width: 30px;">

            <input type="button" onclick="javascript:seatbtn()" value="16"
               style="color: black; background: <%=color.get(15)%>; height: 40px; position: absolute; left: 140px; top: 80px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="17"
               style="color: black; background: <%=color.get(16)%>; height: 40px; position: absolute; left: 120px; top: 120px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="18"
               style="color: black; background: <%=color.get(17)%>; height: 40px; position: absolute; left: 160px; top: 120px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="19"
               style="color: black; background: <%=color.get(18)%>; height: 40px; position: absolute; left: 120px; top: 160px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="20"
               style="color: black; background: <%=color.get(19)%>; height: 40px; position: absolute; left: 160px; top: 160px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="21"
               style="color: black; background: <%=color.get(20)%>; height: 40px; position: absolute; left: 120px; top: 200px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="22"
               style="color: black; background: <%=color.get(21)%>; height: 40px; position: absolute; left: 160px; top: 200px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="23"
               style="color: black; background: <%=color.get(22)%>; height: 40px; position: absolute; left: 120px; top: 240px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="24"
               style="color: black; background: <%=color.get(23)%>; height: 40px; position: absolute; left: 160px; top: 240px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="25"
               style="color: black; background: <%=color.get(24)%>; height: 40px; position: absolute; left: 140px; top: 280px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="26"
               style="color: black; background: <%=color.get(25)%>; height: 40px; position: absolute; left: 230px; top: 90px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="27"
               style="color: black; background: <%=color.get(26)%>; height: 40px; position: absolute; left: 270px; top: 90px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="28"
               style="color: black; background: <%=color.get(27)%>; height: 40px; position: absolute; left: 230px; top: 130px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="29"
               style="color: black; background: <%=color.get(28)%>; height: 40px; position: absolute; left: 270px; top: 130px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="30"
               style="color: black; background: <%=color.get(29)%>; height: 40px; position: absolute; left: 330px; top: 90px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="31"
               style="color: black; background: <%=color.get(30)%>; height: 40px; position: absolute; left: 370px; top: 90px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="32"
               style="color: black; background: <%=color.get(31)%>; height: 40px; position: absolute; left: 330px; top: 130px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="33"
               style="color: black; background: <%=color.get(32)%>; height: 40px; position: absolute; left: 370px; top: 130px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="34"
               style="color: black; background: <%=color.get(33)%>; height: 40px; position: absolute; left: 430px; top: 90px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="35"
               style="color: black; background: <%=color.get(34)%>; height: 40px; position: absolute; left: 470px; top: 90px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="36"
               style="color: black; background: <%=color.get(35)%>; height: 40px; position: absolute; left: 430px; top: 130px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="37"
               style="color: black; background: <%=color.get(36)%>; height: 40px; position: absolute; left: 470px; top: 130px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="38"
               style="color: black; background: <%=color.get(37)%>; height: 40px; position: absolute; left: 230px; top: 180px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="39"
               style="color: black; background: <%=color.get(38)%>; height: 40px; position: absolute; left: 270px; top: 180px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="40"
               style="color: black; background: <%=color.get(39)%>; height: 40px; position: absolute; left: 230px; top: 220px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="41"
               style="color: black; background: <%=color.get(40)%>; height: 40px; position: absolute; left: 270px; top: 220px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="42"
               style="color: black; background: <%=color.get(41)%>; height: 40px; position: absolute; left: 330px; top: 180px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="43"
               style="color: black; background: <%=color.get(42)%>; height: 40px; position: absolute; left: 370px; top: 180px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="44"
               style="color: black; background: <%=color.get(43)%>; height: 40px; position: absolute; left: 330px; top: 220px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="45"
               style="color: black; background: <%=color.get(44)%>; height: 40px; position: absolute; left: 370px; top: 220px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="46"
               style="color: black; background: <%=color.get(45)%>; height: 40px; position: absolute; left: 430px; top: 180px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="47"
               style="color: black; background: <%=color.get(46)%>; height: 40px; position: absolute; left: 470px; top: 180px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="48"
               style="color: black; background: <%=color.get(47)%>; height: 40px; position: absolute; left: 430px; top: 220px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="49"
               style="color: black; background: <%=color.get(48)%>; height: 40px; position: absolute; left: 470px; top: 220px; width: 40px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="50"
               style="color: black; background: <%=color.get(49)%>; height: 40px; position: absolute; left: 560px; top: 80px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="51"
               style="color: black; background: <%=color.get(50)%>; height: 40px; position: absolute; left: 540px; top: 120px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="52"
               style="color: black; background: <%=color.get(51)%>; height: 40px; position: absolute; left: 580px; top: 120px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="53"
               style="color: black; background: <%=color.get(52)%>; height: 40px; position: absolute; left: 540px; top: 160px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="54"
               style="color: black; background: <%=color.get(53)%>; height: 40px; position: absolute; left: 580px; top: 160px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="55"
               style="color: black; background: <%=color.get(54)%>; height: 40px; position: absolute; left: 540px; top: 200px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="56"
               style="color: black; background: <%=color.get(55)%>; height: 40px; position: absolute; left: 580px; top: 200px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="57"
               style="color: black; background: <%=color.get(56)%>; height: 40px; position: absolute; left: 540px; top: 240px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="58"
               style="color: black; background: <%=color.get(57)%>; height: 40px; position: absolute; left: 580px; top: 240px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="59"
               style="color: black; background: <%=color.get(58)%>; height: 40px; position: absolute; left: 560px; top: 280px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="60"
               style="color: black; background: <%=color.get(59)%>; height: 35px; position: absolute; left: 230px; top: 340px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="61"
               style="color: black; background: <%=color.get(60)%>; height: 35px; position: absolute; left: 270px; top: 340px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="62"
               style="color: black; background: <%=color.get(61)%>; height: 35px; position: absolute; left: 230px; top: 375px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="63"
               style="color: black; background: <%=color.get(62)%>; height: 35px; position: absolute; left: 270px; top: 375px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="64"
               style="color: black; background: <%=color.get(63)%>; height: 35px; position: absolute; left: 330px; top: 340px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="65"
               style="color: black; background: <%=color.get(64)%>; height: 35px; position: absolute; left: 370px; top: 340px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="66"
               style="color: black; background: <%=color.get(65)%>; height: 35px; position: absolute; left: 330px; top: 375px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="67"
               style="color: black; background: <%=color.get(66)%>; height: 35px; position: absolute; left: 370px; top: 375px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="68"
               style="color: black; background: <%=color.get(67)%>; height: 35px; position: absolute; left: 430px; top: 340px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="69"
               style="color: black; background: <%=color.get(68)%>; height: 35px; position: absolute; left: 470px; top: 340px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="70"
               style="color: black; background: <%=color.get(69)%>; height: 35px; position: absolute; left: 430px; top: 375px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="71"
               style="color: black; background: <%=color.get(70)%>; height: 35px; position: absolute; left: 470px; top: 375px; width: 40px;">

            <input type="button" onclick="javascript:seatbtn()" value="72"
               style="color: black; background: <%=color.get(71)%>; height: 30px; position: absolute; left: 540px; top: 330px; width: 30px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="73"
               style="color: black; background: <%=color.get(72)%>; height: 30px; position: absolute; left: 540px; top: 360px; width: 30px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="74"
               style="color: black; background: <%=color.get(73)%>; height: 30px; position: absolute; left: 570px; top: 360px; width: 30px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="75"
               style="color: black; background: <%=color.get(74)%>; height: 30px; position: absolute; left: 540px; top: 390px; width: 30px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="76"
               style="color: black; background: <%=color.get(75)%>; height: 30px; position: absolute; left: 570px; top: 390px; width: 30px; border-radius: 18px">

            <input type="button" onclick="javascript:seatbtn()" value="77"
               style="color: black; background: <%=color.get(76)%>; height: 30px; position: absolute; left: 540px; top: 420px; width: 30px; border-radius: 18px">
      </div>


      <script>
   function seatbtn(){ alert('You need to LOGIN first'); }

   </script>


      <div class="rightbox"
         style="width: 230px; left: 730px; top: 45px; height: 170px;">

         <form action=/iSpace/DoLogin method="post"
            style="padding-top: 40px; padding-left: 28px;">
            <table>
               <tr>
                  <td><input id="logintext" type="text" size="30" name="id" placeholder="ID"
                     autocomplete="on" tabindex="1"></td>
               </tr>

               <tr>
                  <td><input id="logintext" type="password" size="30" name="pw" placeholder="PASSWORD"
                     autocomplete="off" tabindex="2"></td>
               </tr>
               <tr>
                  <td rowspan=2><input type="submit" value="LOGIN" tabindex="3" class="logIn"></td>
               </tr>
            </table>
         </form>
      </div>

      <div class="rightbox"
         style="width: 210px; left: 730px; height: 260px; top: 225px; font-size: 17px; padding: 10px">

         공지사항 <a href="/iSpace/view/BOARD/notice.jsp"
            style="text-decoration: none">+ <br></a>

         <%
            int pageNumber = 1; //기본 페이지 넘버
            //페이지넘버값이 있을때
            if (request.getParameter("pageNumber") != null) {
               pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            }
         %>
         <br>
         <%
    noticeDAO notice = new noticeDAO();
    ArrayList<notice> list = notice.getList(pageNumber);
    for (int i = 0; i < list.size(); i++) {
                %>
         <table id="subboard">
         <tr>

            <td><a
               href="/iSpace/view/BOARD/view.jsp?noticeId=<%=list.get(i).getNoticeId()%>">

                  <%
                     if (list.get(i).getNoticeTitle().length() < 20) {
                  %> <%=list.get(i).getNoticeTitle()%><br><%
                   } else {
                   %>
                  <%=list.get(i).getNoticeTitle().substring(0,19)%>...<br>
                  <%} %>
            </a></td>
         </tr>
      </table>
      <%
         }
      %>
   </div>

   </div>


</body>
</html>
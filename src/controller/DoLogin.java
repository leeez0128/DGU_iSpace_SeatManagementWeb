package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

/**
 * Servlet implementation class DoLogin2
 */
@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public DoLogin() {
      super();
      // TODO Auto-generated constructor stub
   }
   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String page = null;
      
      //checkLogin login=new checkLogin();
      String id=request.getParameter("id");
      String pw=request.getParameter("pw");
      
      HttpSession session = request.getSession();

      
      String pass;
      Connection conn = null;
      try {
         conn = DBmanager.getConnection();
      } catch (Exception e1) {
         // TODO Auto-generated catch block
         e1.printStackTrace();
      }

      try {
         Statement stmt = conn.createStatement();
         String sql = "select * from USER where id = "+id;
         ResultSet rs = stmt.executeQuery(sql);
         rs.next();
         pass = rs.getString("pw");
         
         if(pass.equals(pw)) {
            
            //
            String name=rs.getString("name");

            session.setAttribute("id",id);
            session.setAttribute("pw",pw);
            session.setAttribute("name",name);
            //
            
            request.setAttribute("NAME", rs.getString("name"));
            page="/view/home.jsp";
            RequestDispatcher dispatcher=request.getRequestDispatcher(page);
            dispatcher.forward(request, response);   
         }
         else {
            System.out.println("pw error");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('입력하신 아이디 또는 비밀번호가 일치하지 않습니다.'); location.href='/iSpace/view/mainUI.jsp'</script>");
            out.flush();
         }
         DBmanager.close(rs);
         DBmanager.close(stmt);
         DBmanager.close(conn);
      }catch(SQLException e) {
         System.out.println("only id error || id&& pw error");
         //page="/view/mainUI.jsp";
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("<script>alert('입력하신 아이디 또는 비밀번호가 일치하지 않습니다.'); location.href='/iSpace/view/mainUI.jsp'</script>");
         out.flush();
      }

   }

}
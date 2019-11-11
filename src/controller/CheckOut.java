package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckOut
 */
@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOut() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(); //세션추가용

		String my_seatNo=request.getParameter("button");
		String id=(String)session.getAttribute("id"); //현재 로그인 아이디 얻어옴

		Connection conn = null;
		String page;

		System.out.println(my_seatNo);

		try {
			conn = DBmanager.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("DB connection error on checkOut"+e);
		}
		try {
			String sql = "update SEAT set userID=? where seatNo=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"none");
			pstmt.setString(2,my_seatNo);

			pstmt.execute();

			page="/view/home.jsp";
			RequestDispatcher dispatcher=request.getRequestDispatcher(page);
			dispatcher.forward(request, response);   

			DBmanager.close(pstmt);
			DBmanager.close(conn);

		}catch (Exception e)
		{
			System.out.println("!!!!!!!!!!!insert my_seatNo error!!!!!!!!!!");
			e.printStackTrace();
		}


	}
}


package edu.project.olaservice.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginService extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6518667613176482660L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  PrintWriter out = response.getWriter();
		  String userName = request.getParameter("userName");
		  String pass = request.getParameter("pass");
		 
		  String query = "select * from Customer where customer_id = ?";

		    PreparedStatement ps;
			try {
				ps = Utility.getConnection().prepareStatement(query);
				ps.setString(1, userName);
			    ResultSet rs = ps.executeQuery();
			    if(rs.next()) {
			    	if(pass.equals(Utility.getDecryptText(rs.getString("password")))) {
			    		RequestDispatcher rd = request.getRequestDispatcher("home1.jsp");
			    		rd.forward(request, response);
			    	}else  {
			    		out.println("<script type=\"text/javascript\">");
				    	out.println("alert('Invalid user_name or password');");
				    	out.println("location='login.jsp';");
				    	out.println("</script>");
				    	return;
			    	}
			    }
			    ps.close();
			   
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 		    
		   
	
	}
		  
}
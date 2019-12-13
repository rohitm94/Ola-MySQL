package edu.project.olaservice.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationService extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6518667613176482660L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		  String userName = request.getParameter("userName");
		  String firstName = request.getParameter("firstName");
		  String lastName = request.getParameter("lastName");
		  String pass = request.getParameter("pass");
		  String emailId = request.getParameter("emailId");
		  String phone = request.getParameter("phone");
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		  String gender = request.getParameter("gender");
		  
		  String query = "select * from Customer where customer_id = ?";

		    PreparedStatement ps;
			try {
				ps = Utility.getConnection().prepareStatement(query);
				ps.setString(1, userName);
			    ResultSet rs = ps.executeQuery();
			    if(rs.next()) {
			    	   out.println("<script type=\"text/javascript\">");
			    	   out.println("alert('Sorry :( User_name already taken. Choose another');");
			    	   out.println("location='registration.jsp';");
			    	   out.println("</script>");
			    	   return;
			    }
			   
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 		    
		   
		  
		   query = "insert into Customer values(?,?,?,?,?,?,?,?)";

			try {
				ps = Utility.getConnection().prepareStatement(query);
				ps.setString(1, userName);
			    ps.setString(2, firstName); 
			    ps.setString(3, lastName);
			    ps.setString(4, Utility.getEncryptText(pass)); 
			    ps.setString(5, emailId);
			    ps.setString(6, phone);
			    try {
					ps.setDate(7, new java.sql.Date(sdf.parse(request.getParameter("dob")).getTime()));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    ps.setString(8, gender); 
			    int result = ps.executeUpdate();
			    if(result == 1) {
			    	out.println("<script type=\"text/javascript\">");
			    	out.println("alert('Sucessfully inserted record');");
			    	out.println("location='login.jsp';");
			    	out.println("</script>");
			    	ps.close();
			    	return;
			    }
			   
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 		    
		  }
		

	
}
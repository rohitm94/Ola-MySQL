<%@page import="com.mysql.cj.util.Util"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ride History</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>

<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="edu.project.olaservice.service.Utility" %>
<%@ page import="java.util.Random" %>
<%
String query = "select ride_id, r.customer_id, concat_ws(' ',c.first_name,c.last_name) CustomerName, c.email_id, c.phone_number, r.driver_id, concat_ws(' ',d.first_name,d.last_name) DriverName, car_number, pickup_location, drop_location,FLOOR(RAND(2)*30) as Distance from Ride r inner join Customer c on r.customer_id = c.customer_id inner join Driver d on r.driver_id = d.driver_id;";

PreparedStatement ps;
try {
	ps = Utility.getConnection().prepareStatement(query);	
    ResultSet rs = ps.executeQuery();
    %>
    <div>
			<table> 
			<tr>
				<td>Ride Id</td>
				<td>Customer Id</td>
				<td>Customer Name</td>
				<td>Email Id</td>
				<td>Phone number</td>
				<td>Driver Id</td>
				<td>Driver Name</td>
				<td>Car Number</td>
				<td>Pickup Location</td>
				<td>Drop Location</td>
				<td>Ride Distance(Miles)</td>
				<td>Ride Fare($)</td>
			</tr>
			
			<%
    while(rs.next()) { %>
    
				<tr>
					<td><%= rs.getInt(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4) %></td>
					<td><%= rs.getString(5) %></td>
					<td><%= rs.getString(6) %></td>
					<td><%= rs.getString(7) %></td>
					<td><%= rs.getString(8) %></td>
					<td><%= rs.getString(9) %></td>
					<td><%= rs.getString(10) %></td>
					<td><%= rs.getInt(11) %></td>
					<%
					float cost=0;
					query = "select rate_per_mile from RateChart where car_type = (select car_type from Car where car_number = ?);";
					
					ps = Utility.getConnection().prepareStatement(query);	
					ps.setString(1, rs.getString(8));
					ResultSet rs1 = ps.executeQuery();
					if(rs1.next()) {
						cost = rs.getInt(11)*rs1.getFloat(1);
					}
					%>
					<td><%= cost %></td>
				</tr>
<%  
	}
    ps.close();
   
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} 	

%>
</table>
</div>
</body>
</html>
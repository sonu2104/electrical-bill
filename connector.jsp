<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.* "%>
    <%@ page import = "java.io.IOException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>

<% 
try{

					
					Class.forName("com.mysql.cj.jdbc.Driver");
					
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3301/electricity","root","");
					
					PreparedStatement pst=conn.prepareStatement("select *from electricbill");
				     ResultSet rs=pst.executeQuery();
				 
			
	 
				  out.println("<html><body><table><tr><td>name</td><td>id</td><td>mobile</td><td>email</td><td>pass</td><td>address</td>");
				  
             			 
                    while(rs.next())
				  {
        	 
                    
					out.ptintln("<tr><td>" +rs.getString(1)+"</td><td>" +rs.getString(2)+"</td><td>" +rs.getString(3)+"</td><td>" +rs.getString(4)+"</td><td>" +rs.getString(5)+"</td><td>" +rs.getString(6)+"</tr></td>");
					 /* int id=rs.getInt("customer_id");
					  String mobile=rs.getString("mobile_number");
					  String email=rs.getString("email");
					  String pass=rs.getString("password");
					  String address=rs.getString("address");*/
					  out.print("</table></body></html>");
					  }
				  
						  }
				catch(Exception e){
				out.print(e);
					
				}
%>
</table>
</body>
</html>
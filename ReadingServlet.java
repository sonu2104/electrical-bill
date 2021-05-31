

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jdi.connect.spi.Connection;

/**
 * Servlet implementation class ReadingServlet
 */
@WebServlet("/ReadingServlet")
public class ReadingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.print("helooll");
		Connection conn=null;
		
		try{
              Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3301/electricity","root","");
			
			String name=request.getParameter("uname");
			PreparedStatement pst=((java.sql.Connection) conn1).prepareStatement("select * from  bill where customer_name='"+name+"'");
		     ResultSet rs=pst.executeQuery();
		    //pst.setString(1, name);

		  out.println("<html><body><table border='2'><tr><td>Customer_name</td><td>Meter_Number</td><td>Pervious_Reading</td<<td>Current_Reading_</td><td>Consume_Reading</td>><td>Unit_Rate</td><td>Paid_date</td><td>Due_date</td><td>Panlty</td><td>Amount</td>");
		  
     			 
            while(rs.next())
		  {
	        out.println("<tr><td>" +rs.getString(1)+"</td><td>" +rs.getInt(2)+"</td><td>" +rs.getInt(3)+"</td><td>" +rs.getInt(4)+"</td><td>" +rs.getInt(5)+"</td><td>" +rs.getInt(6)+"</td><td>"+rs.getString(7)+"</td><td>" +rs.getString(8)+"</td><td>" +rs.getInt(9)+"</td><td>"+rs.getInt(10)+"</td></tr>");
			 /* int id=rs.getInt("customer_id");
			  String mobile=rs.getString("mobile_number");
			  String email=rs.getString("email");
			  String pass=rs.getString("password");
			  String address=rs.getString("address");*/
			 
			  }
            out.println("</table></body></html>");
            out.println("<a href='home.jsp'>go back</a>");
		  }catch(Exception e){
		    out.print(e);
			
		}
	}

}

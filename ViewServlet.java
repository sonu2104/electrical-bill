import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getContentType();
		PrintWriter out=response.getWriter();
		out.println("hello");
       String name=request.getParameter("your_name");
		int id=Integer.parseInt(request.getParameter("id"));
		int mobile=Integer.parseInt(request.getParameter("mobile"));
		String email1=request.getParameter("email");
		String address=request.getParameter("address");
		Connection conn1=null;
		
try{
	
	Thread.sleep(3000);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3301/electricity","root","");


PreparedStatement pst=conn.prepareStatement("insert into electricbill(customer_name,customer_id,mobile_number,email,address)value(?,?,?,?,?)");
		pst.setString(1, name); 
		pst.setInt(2,id); 
		pst.setInt(3,mobile); 
        pst.setString(4,email1); 
        pst.setString(5,address);
        pst.executeUpdate();
	 out.println("Registred successfully created");

	 
	}
catch(Exception e){
out.print(e);

}
	}


	}



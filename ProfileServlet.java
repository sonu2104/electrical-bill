

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3301/electricity","root","");
PreparedStatement pst=conn.prepareStatement("select into electricbill where customer_name=? ,customer_id=?,mobile_number=?,email=?,address=?");
		pst.setString(1, name); 
		pst.setInt(2,id); 
		pst.setInt(3,mobile); 
        pst.setString(4,email1); 
        pst.setString(5,address);
      ResultSet rs=  pst.executeQuery();
      while(rs.next())
      {
    	  
    	out.println(rs.getString(1));
    	out.println(rs.getInt(2));
    	out.println(rs.getInt(3));
    	out.println(rs.getString(4));
    	out.println(rs.getString(5));
    	  
      }
	 out.println("Registred successfully created");

	 
	}
catch(Exception e){
out.print(e);

}
	}

	}



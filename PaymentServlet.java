

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
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
		
		String card_num=request.getParameter("card_number");
		String  card_date=request.getParameter("card-date");
		String card_cv=request.getParameter("card_cvv");
		String name=request.getParameter("card_name");
		String amount=request.getParameter("amount");
		
		try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3301/electricity","root","");
		
		
		PreparedStatement pst=conn.prepareStatement("insert into payment(card_number,card_date,cvv,name,amount)values(?,?,?,?,?)");
		

		pst.setString(1, card_num);
		pst.setString(2, card_date);
		pst.setString(3, card_cv);
		pst.setString(4, name);
		pst.setString(5, amount);
		int x=  pst.executeUpdate();
		out.println("<htm><body>");
		
		
		
		if(x>0)
		{
				out.println("your"+ amount +" payment successfull");
				
				out.println("<a href='home.jsp'>go back</a>");
				out.println("</body></html>");
			}
		else {
			out.print("your payment not  successfull"+amount);
			response.sendRedirect("home.jsp");
		}
		
		
	  

		
		
		
		}
		catch(Exception e){
		e.printStackTrace();
		
		}
		
	}

}

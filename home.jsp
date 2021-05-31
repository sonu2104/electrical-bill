<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.* "%>
<!DOCTYPE html
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link  rel="stylesheet" href="form.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
 #card1{
 width:100%;
 height:500px;
 }
ul li:hover{
 border:2px solid #ce93d8;
 background-color:#ce93d8;
 }
</style>
<body>
<%
				
				String email=request.getParameter("lemail");
				String pass=request.getParameter("lpass");
				
				
				try{
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3301/electricity","root","");
					
					PreparedStatement pst=conn.prepareStatement("insert into mylogin(email,password)value(?,?)");
			    pst.setString(1,email); 
				  pst.setString(2,pass);
				  
				  int x=pst.executeUpdate();
				  if(x>0 ) {
					 /* if(email.isEmpty() && pass.length()<8)
					  {
						  response.sendRedirect("bill.jsp");
					    }
					  else{
						  response.sendRedirect("home.jsp");
						
				          
					  }*/
				  }
				  
				 }
				catch(Exception e){
				out.print(e);
					
				}
				
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" id="mynav">
  <a class="navbar-brand" href="#">ELECTRICITY BILL</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
  </button>
         <div class="collapse navbar-collapse nav" id="navbarSupportedContent " >
        <ul class="navbar-nav ">
    
      <li class="nav-item active ">
        <a  role="button" class="nav-link "  data-toggle="modal" data-target="#exampleModalCenter"  ><span class=" fa fa-user-circle-o"></span> Register Here!</a>
       <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><span class="	fa fa-user"></span>Profile</h5>
       
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="registred" action="ViewServlet.java" method="post">
      <div class="modal-body">
          <div class="row">
          <div class="col-md-6">
            <label for="recipient-name" class="col-form-label" >Your Name:</label>
            <input type="text" class="form-control" id="card-number"name="your_name" placeholder="enter name">
          </div>
           <div class="col-md-6">
            <label for="recipient-name" class="col-form-label" >Id:</label>
            <input type="number" class="form-control" name="id" id="name" placeholder="enter id">
          </div>
          </div>
          <div class="row">
          
           <div class="col-md-6">
            <label for="recipient-name" class="col-form-label"> Mobile Number:</label>
            <input type="number" class="form-control" id="expairy_date"  name="mobile" placeholder="enter mobile number ">
          </div>
          <div class="col-md-6">
            <label for="recipient-name" class="col-form-label">Email:</label>
            <input type="text" class="form-control" id="recipient-name" name="email" placeholder="enter Email ">
          </div>
          </div>
           <div class="form-group">
            <label for="recipient-name" class="col-form-label"> Address:</label>
            <input type="text" class="form-control" id="recipient-name" name="address" placeholder="enter address">
             
          </div>
          </div>
        </form>
      </div>
      
      <h4 id="profile_heading"></h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" id="button" class="btn btn-primary ">Save changes</button>
      
    </div>
  </div>
       
       
        </li>
        <li class="nav-item active ">
          <a href=""  class="nav-link"   role="button"    data-toggle="modal" data-target="#exampleModalCenter1" ><spna class=" fa fa-lightbulb-o"></spna>Bill</a>
    </li>  
 
     <li>
    <a role="button"  class="nav-link" data-toggle="modal" data-target="#exampleModal"> <span class="fa fa-credit-card-alt"></span>  Payment </a>
    </li>
   
        <li class="nav-item active ">
    <a role="button"  class="nav-link" href="bill.jsp" id="example" onclick="myfunction()"> <span class=""></span>  Logout</a>
    </li> 
  </ul>
   <!-- Modal payment-->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title font-bold" id="exampleModalLabel"> CREDIT/DEBIT CARD PAYMENT</h5>
        <h4 id="msg"></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      
     </div>
      <form action="PaymentServlet" id="profile-details">
      <div class="modal-body">
       
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">CARD NUMBER:</label>
            <input type="text" class="form-control" id="card-number" name="card_number" placeholder="enter card number" required>
          </div>
          <div class="row">
          
           <div class="col-md-6">
            <label for="recipient-name" class="col-form-label"> CARD EXPAIRY:</label>
            <input type="text" class="form-control" id="expairy_date" name="card_date" placeholder=" month/year " required>
          </div>
          <div class="col-md-6">
            <label for="recipient-name" class="col-form-label">CARD CVV:</label>
            <input type="text" class="form-control" id="recipient-name" name="card_cvv" placeholder="enter cvv number" required>
          </div>
          </div>
           <div class="form-group">
            <label for="recipient-name" class="col-form-label">CARD HOLDER NAME:</label>
            <input type="text" class="form-control" id="recipient-name"  name="card_name"placeholder="enter name" required>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label"> Amount:</label>
            <input type="text" class="form-control" id="recipient-name" name="amount" placeholder="enter amount here" required>
          </div>
          
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" id="profile_button" class="btn btn-primary"><span class="fa fa-check-square-o"></span>Finish and Pay</button>
      </div>
      
      </form>
    </div>
  </div>
</div>
  
   <!-- Modal billlllllllllllllllll-->
      </div>
   <div class="modal" tabindex="-1" role="dialog"  id="exampleModalCenter1" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Check your Bill</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="ReadingServlet" id="myform1">
      <div class="modal-body">
    

         <div class="haeder  myhead text-center mt-5">
		
		<input  type="text"  name="uname"  class="myname pt-9" placeholder="enter your name"><br>
		<button class="btn button1 bg-primary" type="submit">Click here</button>
		    
		  </div>
     	</form>
        </div>
        </div>    
          
          
           <!-- Modal profile-->

       
</nav>


 
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active ">
      <img class="d-block " src="back.jpg" alt="First slide" id="card1">
      <div class="carousel-caption d-none d-md-block">
    <h5>Save the electricity, we need it tomorrow</h5>

    <p>ectricity can transform people's lives, not just economically but also socially.</p>
  </div>
    </div>
    <div class="carousel-item ">
      <img class="d-block " src="back1.jpg" alt="Second slide" id="card1" >
      <div class="carousel-caption d-none d-md-block">
    <h5>Save the nation by saving energy.</h5>
    <p>Electricity is derived from many non-renewable energy sources like oil, natural gas and coal.</p>
  </div>
      
    </div>
    <div class="carousel-item ">
      <img class="d-block " src="red.webp" alt="Third slide" id="card1">
      <div class="carousel-caption d-none d-md-block">
    <h5>Save electricity, cooperate with the government.</h5>
    <p>Electricity generation emits more carbon dioxide in the United States than does transportation or industry, and nuclear power is the largest source of carbon-free electricity in the country.</p>
  </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>



 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function(){
	console.log("hello........registred")
	$('#registred').on('submit',function(event){
	     event.preventDefault();
		console.log("login........")
		var f=$(this).serialize();
		$.ajax({
			
			url:"ViewServlet",
			data:f,
			type:"POST",
			success:function(data,status){
				console.log(data);
				console.log("success")
				$(".form").show();
				}
});
		
	});
	
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
	console.log("hello search")
	$('#myform1').on('submit',function(event){
		event.preventDefault();
		var v=$(this).serialize();
		$.ajax({
              url:"meter.jsp",
			data:v,
			type:"POST",
			success:function(data,status){
				console.log(data);
				console.log("success")
				$(".form").show();
				
			   }
		});
	});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	console.log("hello payment")
	$('#profile_details').on('submit',function(event){
		event.preventDefault();
		alert("stop");
		var form=$(this).serialize();
		$.ajax({
              url:"PaymentServlet",
			data:form,
			type:"POST",
			success:function(data,status){
				if(data=="your payment successfull"){
					
					$('#msg').servlet("good");
					}
				else{
					$('#msg').servlet("wrong");
				}
				console.log(data);
				alert("success");
				
			   }
		});
	});
});
</script>
<script>
function myfunction()
{    
	alert("are you sure want quit?");
	
	
	}
</script>


</body>
</html>




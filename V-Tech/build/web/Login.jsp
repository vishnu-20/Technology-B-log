

<%@page import="com.vorg.vTech.helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner{

                clip-path: polygon(23% 0, 80% 0%, 100% 0, 100% 100%, 69% 96%, 36% 100%, 0 96%, 0 0);
            }
            .shadow{
                border-radius: 10px;

                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);


            }


        </style>
    </head>
    <body style="background-color: #e0f2f1 ">
        <%@include file="Header.jsp" %>
        <main  class="d-flex align-items-center primary" style=" height: 70vh">
            <div class="container" >
                <div class="row">
                    <div class="col-md-7 offset-md-2">
                        <div class="card border-info mb-3 shadow " >
                            <div class="card-header text-center" >
                                <span class="fa fa-user-tie fa-3x"></span>
                                <div class="fa fa-user-circle fa-3x"></div>
                                <p>  LogIn here</p>
                            </div>
                            <%
                                Message msg = (Message) session.getAttribute("msg");
                                if (msg != null) {

                            %>
                            <div class="alert <%= msg.getCssClass()%> text-center" role="alert">
                                <%= msg.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }

                            %>

                            <div class="card-body">
                                <form id="myForm" action="LoginServlet" method="get">
                                    <div class="form-group">
                                        <label for="Email1">Email address</label>
                                        <input name="email" type="email" class="form-control" id="Email1" aria-describedby="emailHelp" placeholder="Enter email">

                                    </div>
                                    <div class="form-group">
                                        <label for="Password">Password</label>
                                        <input type="password" name="pass" class="form-control" id="Password" placeholder="Password">
                                    </div>
                                    
                                
                                    <div class="form-group posi">
                                        <button type="submit"  class="btn btn-outline-info " >Login</button>
                                        <a href="Register.jsp" type="button"  class="btn btn-outline-info " >SignUp</a>  
                                    </div>

                                    <hr>
                                </form> 
                                <div class="text-center"><a data-toggle="modal" data-target="#ForgetPassModal" href="#">Forgot Password</a></div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
                            
 

<!-- Modal -->
<div class="modal fade" id="ForgetPassModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
       
      </div>
      <div class="modal-body">
          <form method="post" action="ForgetPasswordServlet">
              <div class="form-group"> 
                  <input type="text" placeholder="Enter your email address" class="form-control">
              
              </div>
              <div class="container text-center"> 
                  <button type="submit" class="btn btn-outline-info ">Get Account</button>
              
              </div>
              
              
          </form>     
      </div>
     
    </div>
  </div>
</div>

        </main>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script>
     $(document).ready(function (){
         
         console.log("ok");
         
         
     })
     
      


        </script>
    </body>
</html>

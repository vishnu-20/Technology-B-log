

<%@page import="com.vorg.vTech.helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .shadow{
                border-radius: 10px;

                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
        </style>

    </head>
    <body style="background-color: #e0f2f1 ">
        <%@include file="Header.jsp" %>
        <main  class="d-flex align-items-center primary" style=" height: 80vh">
            <div class="container" >
                <div class="row">
                    <div class="col-md-7 offset-md-2">
                        <div class="card border-info mb-3 shadow " >
                            <div class="card-header text-center" >
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p> Register Here</p>
                            </div>
                            <%
                                Message msg = (Message) session.getAttribute("success");
                                Message msgs = (Message) session.getAttribute("error");
                                Message msg2 = (Message) session.getAttribute("error1");
                                if (msg != null) {
                            %>
                            <div class="alert <%= msg.getCssClass()%> text-center" role="alert">
                                <%=msg.getContent()%>
                            </div>
                            <%
                                session.removeAttribute("success");
                            } else if (msgs != null) {

                            %>
                            <div class="alert <%= msgs.getCssClass()%> text-center" role="alert">
                                <%=msgs.getContent()%>
                            </div>                      

                            <%
                                session.removeAttribute("error");
                            } else if (msg2 != null) {

                            %>
                            <div class="alert <%= msg2.getCssClass()%> text-center" role="alert">
                                <%=msg2.getContent()%>
                            </div>  
                            <%
                                    session.removeAttribute("error1");
                                }
                            %>

                            <div class="card-body">
                                <form  action="RegisterServlet" method="post" id="myform">
                                    <div class="form-group">
                                        <label for="name">Full Name<span class="text-danger">*</span></label>
                                        <input type="name" class="form-control" id="Email1" aria-describedby="nameHelp" name="userName" placeholder="Enter name">

                                    </div>
                                    <div class="form-group">
                                        <label for="Email1">Email address<span class="text-danger">*</span></label>
                                        <input type="email" class="form-control" name="email" id="Email1" aria-describedby="emailHelp" placeholder="Enter email">

                                    </div>
                                    <div class="form-group">
                                        <label for="Password">Password<span class="text-danger">*</span></label>
                                        <input type="password" class="form-control" id="Password" name="pass" placeholder="Password">
                                    </div>

                                    <div class="form-group">
                                        <label for="g">Gender<span class="text-danger">*</span></label>
                                        <br>
                                        <span >
                                            <input type="radio"  value="male" name="gender" id="g">Male  

                                        </span>

                                        <span style="margin-left: 50px">
                                            <input  type="radio" value="female" name="gender" id="g">Female
                                        </span>

                                    </div>

                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="Check" name="check" value="ok">
                                        <label class="form-check-label" for="Check">accept terms and condition<span class="text-danger">*</span></label>
                                    </div>
                                    <br>
                                    <div class="form-group posi">
                                        <button type="submit"  class="btn btn-outline-info " >Register</button>

                                    </div>
                                </form> 

                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </main>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>

//            $(document).ready(function () {
//                console.log("loading...")
//
//                $('#myform').on('submit', function (event) {
//                    event.preventDefault();
//
//                    let form = new FormData(this);
//
//                    $.ajax({
//                        url: "RegisterServlet",
//                        type: 'POST',
//                        data: form,
//                        contentType: false,
//                        processData: false
//
//
//                    })
//
//                })
//
//
//            })




        </script>
    </body>
</html>

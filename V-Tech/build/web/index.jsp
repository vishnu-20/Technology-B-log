
<%@page import="com.vorg.vTech.helper.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V-Tech</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

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
    <body>

        <%@include file="Header.jsp" %>

        <div class="container-fluid p-0 m-0">
            <div class="jumbotron banner" style="background: #e0f2f1  ">
                <div class="container">
                    <h1 class="display-4">Welcome to V-Tech</h1>
                    <p>

                        A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.

                    </p>
                    <p>
                        Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.[1] The programs for these machines (such as a player piano's scrolls) did not produce different behavior in response to different inputs or conditions.
                    </p>
                    <a href="Login.jsp" class="btn btn-outline-info ">Login/SignUp</a>
                    <button class="btn btn-outline-info">Keep in touch</button>
                </div>

            </div> 

        </div>
        <div class="container">
            <div class="row mb-3">
                <div class="col-md-4 ">

                    <div class="card border-info mb-3 shadow " style="width: 18rem; border-radius:10px ">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <button class="btn btn-outline-info">Go somewhere</button>
                        </div>
                    </div>


                </div>
                <div class="col-md-4">

                    <div class="card border-info mb-3 shadow" style="width: 18rem; border-radius:10px ">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <button class="btn btn-outline-info">Go somewhere</button>
                        </div>
                    </div>


                </div>
                <div class="col-md-4">

                    <div class="card border-info mb-3 shadow" style="width: 18rem; border-radius:10px ">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <button class="btn btn-outline-info">Go somewhere</button>
                        </div>
                    </div>


                </div>
            </div>
            <div class="row">
                <div class="col-md-4">

                    <div class="card border-info mb-3 shadow" style="width: 18rem; border-radius:10px ">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <button class="btn btn-outline-info">Go somewhere</button>
                        </div>
                    </div>


                </div>
                <div class="col-md-4">

                    <div class="card border-info mb-3 shadow" style="width: 18rem; border-radius:10px ">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <button class="btn btn-outline-info">Go somewhere</button>
                        </div>
                    </div>


                </div>
                <div class="col-md-4">

                    <div class="card border-info mb-3 shadow" style="width: 18rem; border-radius:10px ">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <button class="btn btn-outline-info">Go somewhere</button>
                        </div>
                    </div>


                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script>



        </script>
    </body>
</html>

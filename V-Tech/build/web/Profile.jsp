

<%@page import="com.vorg.vTech.helper.Connect"%>
<%@page import="com.vorg.vTech.DAO.PostDAO"%>
<%@page import="com.vorg.vTech.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.vorg.vTech.helper.Message"%>
<%@page import="com.vorg.vTech.entity.Register"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <%
            Register user = (Register) session.getAttribute("currentUser");
        %>
        <nav class="navbar navbar-expand-lg navbar-dark navBackground">
            <a class="navbar-brand "  href="Profile.jsp">V-Tech</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#AddPost">Post</a>
                    </li>



                    <!--     <li class="nav-item">
                           <a class="nav-link" href="Register.jsp">Register</a>
                     </li>-->
                    <!--            <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Dropdown
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </li>-->
                    <!--            <li class="nav-item">
                                    <a class="nav-link disabled" href="#">Disabled</a>
                                </li>-->
                </ul>
                <!--        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class=" btn btn-outline-info my-2 my-sm-0 " style=" color: white " type="submit">Search</button>
                        </form>-->


                <ul class="navbar-nav mr-right">
                    <li class="nav-item ">
                        <a class="nav-link " style="color: #ffffff" href="#" id="b" data-bs-toggle="modal" data-bs-target="#myModal"><%= "Hi, " + user.getName().substring(0, 1).toUpperCase() + user.getName().substring(1)%></a> </li>
                    <li class="nav-item" >
                        <a class="nav-link" style="color: #ffffff" href="LogoutServlet">Logout</a> </li>

                </ul>



            </div>
        </nav>
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {

        %>
        <div class="alert <%=m.getCssClass()%>" role="alert">
            <%=m.getContent()%>
        </div>

        <%
                session.removeAttribute("msg");
            }


        %>


        <main>
            <!-- category listing -->
            <div class="container-fluid">
                <div class="row mt-3">
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action "  onclick="getPostById(0)"style ="color: #009688 ">
                                <b>Lets Read</b>
                            </a>
                            <%                                PostDAO allPost = new PostDAO(Connect.getConnection());
                                List<Category> category = allPost.getAllCat();

                                for (Category c : category) {
                            %>   

                            <a href="#" class="list-group-item list-group-item-action" onclick="getPostById(<%=c.getcId()%>)"><%=c.getName()%></a>     

                            <%
                                }
                            %>

                        </div>             
                    </div>
                    <!-- All post listing -->
                    <div class="col-md-8" id="post_container">

                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-5x fa-spin "></i>
                        </div>

                    </div>

                </div>



            </div>

        </main>


        <!-- modal  -->
        <!-- Button trigger modal -->
        <!--        <button type="button" class="btn btn-primary" id="b" data-bs-toggle="modal" data-bs-target="#myModal">
                    Launch demo modal
                </button>-->

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header " style="background-color: #009688">

                        <h5 class="modal-title " id="exampleModalLabel">V-Tech</h5>

                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img style="border-radius: 60%; max-width: 150px" src="img\<%=user.getProfilePic()%>">
                            <br>
                            <br>
                            <div id="profileDetails">

                                <table class="table ">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Name</th>
                                            <td><%=user.getName()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%=user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%=user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Created On</th>
                                            <td><%=user.getDateTime()%></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                            <div id="edit" style="display: none">
                                <form action="ProfileEditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table ">

                                        <tbody>
                                            <tr>
                                                <th scope="row">ID</th>
                                                <td><%= user.getId()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Name</th>
                                                <td>

                                                    <input type="text" class="form-control" name="user_name" value="<%=user.getName()%>">

                                                </td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Password</th>
                                                <td>
                                                    <input class="form-control" type="password" name="password" value="<%=user.getPassword()%>">   
                                                </td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Email</th>
                                                <td><%=user.getEmail()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Gender</th>
                                                <td>

                                                    <%= user.getGender().toUpperCase()%>

                                                </td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Created On</th>
                                                <td><%=user.getDateTime()%></td>
                                            </tr>

                                            <tr>
                                                <th scope="row" >Profile</th>
                                                <td>
                                                    <input type="file" name="file" class="form-control" >
                                                </td>
                                            </tr>


                                        </tbody>
                                    </table>    
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-info">Save</button>

                                    </div>

                                </form>
                            </div>

                        </div> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="save" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-info" id="editBtn">Edit</button>

                    </div>
                </div>
            </div>
        </div>
        <!-- end -->


        <!-- post modal -->

        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="AddPost" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #009688">
                        <h5 class="modal-title" id="exampleModalLabel">Post</h5>

                    </div>
                    <div class="modal-body">
                        <form  method="post" enctype="multipart/form-data" id="add-post" action="AddPostServlet">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Title</label>
                                <input type="text" class="form-control" id="exampleFormControlInput1" name="ptitle" >
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Example select</label>
                                <select class="form-control" id="exampleFormControlSelect1" name="cat">
                                    <option selected disabled>--select--</option>
                                    <%
                                        PostDAO pdao = new PostDAO(Connect.getConnection());
                                        List<Category> cs = pdao.getAllCat();
                                        for (Category c : cs) {
                                    %>
                                    <option value="<%= c.getcId()%>"><%=c.getName()%></option>

                                    <%
                                        }
                                    %>

                                </select>
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Content</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="image">Image</label>
                                <input class="form-control" type="file" name="imageValue">
                            </div>
                            <div class="container ">
                                <button type="submit" class="btn btn-outline-info form-control">Post</button>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!-- post modal end -->

        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
                                $(document).ready(function () {

                                    $('#b').click(function () {

                                        $('#myModal').modal();
                                    });

                                    var toggle = false;
                                    $('#editBtn').click(function () {
                                        if (toggle === false) {
                                            $('#profileDetails').hide();
                                            $('#edit').show();
                                            $(this).text("Back");
                                            toggle = true;
                                        } else if (toggle === true) {

                                            $('#profileDetails').show();
                                            $('#edit').hide();
                                            $(this).text("Edit");
                                            toggle = false;
                                        }
                                    });

                                });
        </script>

        <!--        <script>
                    $(document).ready(function () {
        
                        $('#add-post').on("submit", function (event) {
                            event.preventDefault();
                            let  form = new FormData(this);
        
                            $.ajax({
                                url: "AddPostServlet",
                                type: 'POST',
                                data: form,
                                success: function (data, textStatus, jqXHR) {
                                  console.log("done");
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
        
                                },
                                processData: false,
                                contentType: false
        
        
                            })
        
                        })
        
                    })
        
                </script>-->



        <script>

            function getPostById(catId) {
                $.ajax({
                    url: "displayPost.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                       
                        $("#loader").hide();
                        $("#post_container").html(data);
                    }

                });
            }


            $(document).ready(function (e) {
                getPostById(0);
            });


        </script>
    </body>




</html>

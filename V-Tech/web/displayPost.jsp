<%@page import="java.util.List"%>
<%@page import="com.vorg.vTech.entity.Post"%>
<%@page import="com.vorg.vTech.helper.Connect"%>
<%@page import="com.vorg.vTech.DAO.PostDAO"%>
<style>

    .shadow{
        border-radius: 10px;

        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);


    }
</style>

<div class="row">


    <%
        PostDAO postDAO = new PostDAO(Connect.getConnection());
        List<Post> allPost = null;

        int catgoryId = Integer.parseInt(request.getParameter("cid"));
        if (catgoryId == 0) {
            allPost = postDAO.getAllPost();

        } else {
            System.out.println("------------------going for getpostBy Id -----------------");
            allPost = allPost = postDAO.getPostByCatId(catgoryId);
        }

        for (Post post : allPost) {


    %>


    <div class="col-md-4" style="padding: 10px; " >

        <div class="card shadow border-info" style="border-radius: 10px ">
            <img class="card-img-top"  src="img\<%=post.getImage()%>" height="300px" width="200px" style="border-radius:10px ">
            <div class="card-body">
                <h5 class="card-title"><%=post.getTitle()%></h5>
                <p><%=post.getContent()%></p>

            </div>
            <div class="card-footer">
                <small class="text-muted">Last updated on: <%=post.getDateTime()%></small>
            </div>
        </div> 

    </div>

    <%
        }

    %>
</div>

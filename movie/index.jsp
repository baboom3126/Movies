<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id = "database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="127.0.0.1" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="happyfarm" />
  <jsp:setProperty property="user" name="database" value="root" />
  <jsp:setProperty property="password" name="database" value="" />
</jsp:useBean>
<%
  database.connectDB();
  database.query("select * from products order by rating_f desc;");
  ResultSet rs = database.getRS();
  int count=2;
%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>MOVIES</title>

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="./css/materialize.min.css">
    <script src="./js/materialize.min.js"></script>
    <link rel="stylesheet" href="./css/main.css">

  </head>
  <body>

    <nav>
      <div class="nav-wrapper" >
        <a href="./index.jsp" class="brand-logo">MOVIES</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li><a href="./backend/orderIndex.jsp">後臺管理</a></li>
        </ul>
      </div>
    </nav>

<div class="container" >

  <%
      if (rs != null){
        while(rs.next()){

          String id = rs.getString("id");
          String name = rs.getString("name");
          String image = rs.getString("image");
          String description = rs.getString("description");
          String createdAt = rs.getString("createdAt");
          int rating = rs.getInt("rating");
          float rating_f=rs.getFloat("rating_f");
if(count%2==0){
  out.print("<div class='row'>");
}
  %>
<div class="card " style=" margin:20px; width:45%; display:inline-block; float:left;">
  <img src="./img/<%=image%>" alt="" width="200px"  style="float:left;">
    <div class="card_header">
      <%=name%>(<%=rating_f%>分)
    </div>
    <div class="card_content">
<%=description%>
    </div>

    <div class="card_bottom">
      <form class="" action="./rating.jsp" method="post">
        <input type="hidden" name="movie_name" value="<%=name%>">

<button type="submit" class="btn" name="button" value="<%=id%>">評分</button>
      </form>
    </div>
</div>



<%
if(count%2==1){
out.print("</div>");
}
count++;
}}%>
    </div>




<%
try{
rs.close();}
catch(Exception e){}
%>

  </body>

</html>

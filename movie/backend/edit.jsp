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
  database.query("select * from products order by rating desc;");
  ResultSet rs = database.getRS();
  int count=2;
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EDIT</title>
    <script src="js/jquery.js" charset="utf-8"></script>
    <script src="js/bootstrap.js" charset="utf-8"></script>
    <script src="js/semantic.js" charset="utf-8"></script>
    <script src="js/materialize.js" charset="utf-8"></script>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Semantic UI CSS -->
    <link href="css/materialize.css" rel="stylesheet">

    <link href="css/semantic.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">

    <script type="text/javascript">
      $(document).ready(

      );
    </script>
  </head>

  <body>


    <%

String o_name="";
String o_des="";
String o_img="";


    request.setCharacterEncoding("UTF-8");

    String id_value= request.getParameter("hidden_edit");

    %>

<%

if (rs != null){
  while(rs.next()){

    String id = rs.getString("id");
    String name = rs.getString("name");
    String image = rs.getString("image");
    String description = rs.getString("description");
    
      if(id_value.equals(id))
      {
        o_name=name;
        o_des=description;
        o_img=image;
      }
  }}
%>

<div class="div_main">

<div class="header_main">
  <span style="font-size:36px; font-weight:border;">修改</span>
</div>

<div class="div_main1">

<div class="orderdetail card">
<div class="line4">
</div>


<div class="container" style="font-size:22px; padding:20px; width:50%;">

<form class="" action="edit_movie.jsp" method="post">

  名字
  <br>
<input type="text" name="name1" value="<%=o_name%>" style="width:25%;" >
  <br>
描述
<br>
  <input type="text" name="des1" value="<%=o_des%>" style="width:50%;">
<br>
相片
<br>
<input type="text" name="img1" value="<%=o_img%>" style="width:20%;">
  <br>
    <input type="hidden" name="id_value" value="<%=id_value%>">

  <button type="submit" name="button" class="btn">確定</button>
  <button type="reset" name="button" class="btn">重設</button>
</form>

</div>

</div>


</div></div>

    <script type="text/javascript">
      $("#nav-button").click(
        function(){
          $('.ui.labeled.icon.sidebar').sidebar('toggle');
        }
      );
    </script>
  </body>
</html>

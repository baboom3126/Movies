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
  database.query("select * from products order by id;");
  ResultSet rs = database.getRS();

%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
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




<div class="div_main">

<div class="header_main">
  <span style="font-size:36px; font-weight:border; text-align:center;">電影管理主頁</span>
  <a href="../index.jsp" style="float:right;" onMouseOver="this.style.color='white'" onMouseOut="this.style.color='#00acc1'">回首頁</a>
</div>

<div class="div_main1">

<div class="orderdetail card">
<div class="line4">
</div>

  <div class="content_table">
  <table border="1px" class="striped" style="border-style:dashed;">
  <tr>
    <th class="th11" height="70px">ID</th><th class="th11">名字</th><th class="th11">描述</th><th class="th11">相片</th><th class="th11">修改</th><th class="th11">刪除</th>
  </tr>

  <%
      if (rs != null){
        while(rs.next()){

          String id = rs.getString("id");
          String name = rs.getString("name");
          String image = rs.getString("image");
          String description = rs.getString("description");
          String createdAt = rs.getString("createdAt");
          String des="";
          try{
          des=description.substring(0,12)+"...";
}
catch(Exception e){
  des=description;
}
  %>

  <tr>
    <th class="th1" height="60px"><%=id%></th>
    <th class="th1"><%=name%></th>
    <th class="th1"><%=des%></th>
    <th class="th1"><img src="../img/<%=image%>" width="75px"></th>
    <th class="th1"><a href="#" class="btn">修改</a></th>
    <th class="th1">
      <form class="" action="delete.jsp" method="post">
        <input type="hidden" name="hidden" value="<%=id%>">
        <button type="submit" name="button" class="btn" value="<%=id%>">刪除</button>
      </form>

    </th>


  </tr>

<%}}%>

  </table>
  </div>


<a href="./new.jsp" class="btn">新增電影</a>
<div class="line4"></div>

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

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

<div class="container">

<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("button");
String name=request.getParameter("movie_name");

%>


<div class="card" style="width:20%; display:inline-block;">

  <form action="./go_rating.jsp">
    <br>
    <%=name%>
    <br>
    <p>
      <input name="group1" type="radio" id="test1" value="1"/>
      <label for="test1">非常糟糕(1)</label>
    </p>
    <p>
      <input name="group1" type="radio" id="test2" value="2"/>
      <label for="test2">糟糕(2)</label>
    </p>
    <p>
      <input name="group1" type="radio" id="test3" value="3"/>
      <label for="test3">普通(3)</label>
    </p>
    <p>
      <input name="group1" type="radio" id="test4" value="4"/>
      <label for="test4">好看(4)</label>
    </p>
    <p>
      <input name="group1" type="radio" id="test5" value="5"/>
      <label for="test5">超級好看(5)</label>
    </p>
    <input type="hidden" name="id" value="<%=id%>">
    <input type="submit" name="" class="btn" value="送出">
      <br>
  </form>

</div>
</div>

<%rs.close();%>




  </body>

</html>

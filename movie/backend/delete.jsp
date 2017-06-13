<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>

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
  <span style="font-size:36px; font-weight:border;">商品管理主頁</span>
</div>

<div class="div_main1">

<div class="orderdetail card">
<div class="line4">
</div>

<%
request.setCharacterEncoding("UTF-8");

String id_value= request.getParameter("hidden");
out.print("id="+id_value);

  String message = "";

    message = "刪除成功！";
out.print(message);
%>
<%


String ip="127.0.0.1:3306";
String user="root";
String pwd="";
String db="happyfarm";
String driver="com.mysql.jdbc.Driver";
Connection con = null;
Statement stmt = null;
ResultSet rs= null;
try{
  String url="jdbc:mysql://"+ip+"/"+db+"?useUnicode=true&characterEncoding=utf-8";
  Class.forName(driver).newInstance();
  con=DriverManager.getConnection(url,user,pwd);
  stmt=con.createStatement();

}catch(Exception ex){
  out.print(ex);
}

try{
  String sql = "delete from products where id = " + id_value + ";";
  int a = stmt.executeUpdate(sql);
}catch(Exception ex){
  System.out.println(ex);
}

%>




</div>


</div></div>

    <script type="text/javascript">
      $("#nav-button").click(
        function(){
          $('.ui.labeled.icon.sidebar').sidebar('toggle');
        }
      );
    </script>
    <meta http-equiv='refresh' content='0;url=orderIndex.jsp'>

  </body>
</html>

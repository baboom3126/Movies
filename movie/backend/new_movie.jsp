<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>


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
  <span style="font-size:36px; font-weight:border;">新增</span>
</div>

<div class="div_main1">

<div class="orderdetail card">
<div class="line4">
</div>


<div class="container" style="font-size:22px; padding:20px; width:50%;">


<%
request.setCharacterEncoding("UTF-8");

String name=request.getParameter("name1");
String description=request.getParameter("des1");
String image= request.getParameter("img1");
out.print(name+description+image);
out.print("<br>");
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
String sql = "insert into products (name, description,image) values (?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1,name);
      ps.setString(2,description);
      ps.setString(3,image);
      ps.executeUpdate();
      out.print("新增成功");

}
catch(Exception e){out.print("新增失敗");}

%>


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
  <meta http-equiv='refresh' content='0;url=orderIndex.jsp'>

</html>

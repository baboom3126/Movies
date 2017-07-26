<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>


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



</div>

<%
request.setCharacterEncoding("UTF-8");
int rating;
String rating1=request.getParameter("group1");
float rating2=Float.parseFloat(rating1);
String id=request.getParameter("id");
rating=Integer.parseInt(rating1);
int number=1;
int current_number=0;
int current_rating=0;
float rating_f=0;
/////////////////////////////////////////
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
//////////連線完成////////////

try{
  String query = "select number from products where id=" +id;

  rs=stmt.executeQuery(query);
  rs.next();
  current_number=rs.getInt("number");
  out.print(current_number+"<br>");
}
catch(Exception e){out.print (e);}


try{
  String query1="select rating from products where id=" +id;
  rs=stmt.executeQuery(query1);
  rs.next();
  current_rating=rs.getInt("rating");
}
catch(Exception e){out.print(e);}


try{
  String query1="select rating_f from products where id=" +id;
  rs=stmt.executeQuery(query1);
  rs.next();
  rating_f=rs.getFloat("rating_f");
}
catch(Exception e){out.print(e);}




int final1=((current_number*current_rating)+rating)/(current_number+1);

float cur_num_f=(float)current_number;

float final2=((cur_num_f*rating_f)+rating2)/(cur_num_f+1);

out.print(final1);
////////上傳評分 人數////////
try{
  String sql = "update products set number = '" + (current_number+1) + "' , rating_f = '" + final2 +  "' where id = " + id;
  int a = stmt.executeUpdate(sql);
}

catch(Exception e){}

out.print("評分完成");

rs.close();
stmt.close();
%>
  </body>
  <meta http-equiv='refresh' content='0;url=index.jsp'>

</html>

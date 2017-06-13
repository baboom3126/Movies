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

<form class="" action="new_movie.jsp" method="post">

  名字
  <br>
<input type="text" name="name1" value="" style="width:25%;">
  <br>
描述
<br>
  <input type="text" name="des1" value="" style="width:51%;">
<br>
相片
<br>
<input type="text" name="img1" value="" style="width:20%;">
  <br>
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

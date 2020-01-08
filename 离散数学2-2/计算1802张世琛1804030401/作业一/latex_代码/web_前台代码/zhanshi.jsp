<%--
  Created by IntelliJ IDEA.
  User: XU
  Date: 2019/11/22
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $(".jumbotron").hide();
            $(".jumbotron").slideDown(400);
            $("#test123").hide();
            $("#test123").slideDown(700);
            $("#table-responsive").hide();
            $("#table-responsive").slideDown(1500);
        })
    </script>
</head>
<body>
<%--<c:forEach begin="0" var="i" end="${f:lenght(sss)-1}"  >--%>
<%--    <c:forEach begin="0" var="j" end="${f:lenght(sss[i]-1)}">--%>
<%--        ${requestScope.a[i][j]}--%>

<%--    </c:forEach>--%>

<%--    </c:forEach>--%>
<br>
<br>
<div class="jumbotron" style="width: 60%;display:block;margin:0 auto;text-align: center;">
    <p><a class="btn btn-primary btn-lg" href="test.jsp" role="button">回到首页，继续计算</a></p>
    <h2>恭喜，计算成功!</h2>

</div>
<div  style="width: 60%;display:block;margin:0 auto;text-align: center;">
    <br>
    <c:if test="${error!=null}">
        <script>
            alert("${error}");
        </script>
    </c:if>
    <div id="test123" style="height: 40px; font-size: 20px;">
    <c:if test="${error==null}">
        <div class="alert alert-success" role="alert"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> ${ji_he}</div>
        <div class="alert alert-info" role="alert"><span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>${ban_qun}</div>
        <div class="alert alert-warning" role="alert"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> ${du_yi_dian}</div>
        <div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-random" aria-hidden="true"></span> ${qun}</div>
    </c:if>
    </div>

</div>
<%
    int a= (int) request.getAttribute("n123");
    a=a-1;
%>
<div  id="table-responsive" style="width: 60%;display:block;margin:0 auto;text-align: center; margin-top: 300px;">
    <h3>矩阵运算表如下:</h3>

   <table class="table table-hover table-bordered table-striped" >
    <c:forEach var="i" begin="0" end="<%= a %>">
<%--        <c:forEach var="i" begin="0" end="${f:length(s123)} - 1">--%>
        <tr>
        <c:forEach var="j" begin="0" end="<%= a %>">
            <td class="success">${requestScope.s123[i][j]}</td>
        </c:forEach>
        </tr>
    </c:forEach>
   </table>

</div>

</body>
</html>

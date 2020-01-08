//后台Servlet代码
package cn.itcast.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

@WebServlet("/testServlet")
public class testServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");

        //
        String n1 = request.getParameter("123");

        int n = 0;

        try {
            n = Integer.parseInt(n1);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        request.setAttribute("n123",n);

        String[][] s = new String[n+10][n+10];
        n=n-1;
        for (int i = 0; i<=n; i++) {
            s[i]= request.getParameterValues("user"+i+"[]");
        }
        request.setAttribute("s123",s);

        String str = "集合A关于 "+s[0][0]+" 的运算封闭，且该代数系统：";
        request.setAttribute("ji_he",str);
        Map<String, Integer> map = new HashMap<String, Integer>();

        for (int i = 1; i <= n; i++) {
            map.put(s[0][i], i);
        }
        int flag = 0;
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                for (int k = 1; k <= n; k++) {
                try {
                    if (map.get(s[i][map.get(s[j][k]).intValue()]).intValue() != map.get(s[map.get(s[i][j]).intValue()][k]).intValue()) {
                        flag = 1;
                        break;
                    }
                }catch (Exception e){
                    request.setAttribute("error","该集合不封闭，不符合题设!");

                }

                }
                if (flag == 1) break;
            }
            if (flag == 1) break;
        }
        if (flag == 0) request.setAttribute("ban_qun","是否是半群：是");
        else request.setAttribute("ban_qun","是否是半群：不是");

        int k = 0;
        for (int i = 1; i <= n; i++) {
            int cnt = 0;
            for (int j = 1; j <= n; j++) {
                if (s[i][j].equals(s[0][j])) cnt++;
            }
            if (cnt == n) {
                k = i;
                break;
            }
        }
        flag = 0;
        if (k == 0) {
            request.setAttribute("du_yi_dian","是否是独异点：不是");
            flag = 1;
        } else {
            int cnt = 0;
            for (int i = 1; i <= n; i++) {
                if (s[i][0].equals(s[i][k])) {
                    cnt++;
                }
            }
            if (cnt == n) {
                request.setAttribute("du_yi_dian","是否是独异点：是");
            } else {
                flag = 1;
                request.setAttribute("du_yi_dian","是否是独异点：不是");
            }
        }
        if (flag == 1) {
            request.setAttribute("qun","是否是群：不是");
        } else {
            int cnt1 = 0;
            for (int i = 1; i <= n; i++) {
                int f = 0;
                for (int j = 1; j <= n; j++) {
                    if (s[i][j].equals(s[0][k])) f = 1;
                }
                if (f == 1) cnt1++;
            }
            int cnt2 = 0;
            for (int i = 1; i <= n; i++) {
                int f = 0;
                for (int j = 1; j <= n; j++) {
                    if (s[j][i].equals(s[k][0])) f = 1;
                }
                if (f == 1) cnt2++;
            }
            if (cnt2 == n && cnt1 == n) {
                request.setAttribute("qun","是否是群：是");
            } else {
                request.setAttribute("qun","是否是群：不是");
            }
        }

        request.getRequestDispatcher("/zhanshi.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}


//前台jsp代码-1
<%--
  Created by IntelliJ IDEA.
  User: XU
  Date: 2019/11/22
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
</head>
<body>
<nav class="navbar  navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Brand</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div style="width: 80%;display:block;margin:0 auto;text-align: center;">


<div  class="table-responsive" >
    <form action="${pageContext.request.contextPath}/testServlet" method="post" id="table-responsive">
        <h3>代数系统性质判断器</h3>
        请输入矩阵大小： <input type="text" value="3" id="rows" name="123">
        <button id = "idd" type="button" class="btn btn-success" onclick="creatTab()">创建表格</button>
        <br>
        <br>

        <br>

    </form>
</div>
<script>
    function creatTab(){
        rows=document.getElementById('rows').value;
        rows=document.getElementById('rows').value;
        div1=document.getElementById('table-responsive');
        // alert(rows+'\n'+rows)
        var tab='<h3>代数系统性质判断器</h3>\n' +
            '        请输入矩阵大小： <input type="text" value="'+rows+'" id="rows" name="123">\n' +
            '        <button id = "idd" type="button" class="btn btn-success" onclick="creatTab()">创建表格</button>\n' +
            '        <br>\n' +
            '        <br>\n' +
            '<h3>请在下列矩阵输入运算表:</h3>\n' +
            '<h4>第一格为运算符号，第一行其他格为集合各个元素</h4>\n' +
            '        <br><table id="idd2" class="table table-hover table-bordered table-striped" style="display: none">';
        var fa = 0;

        for(var i=0;i<rows;i++){
            tab+='<tr>';
            for(var j=0;j<rows;j++){
                if(fa==1){
                    tab+="<td class=\"active\"><input type=\"text\"  name='user"+i+"[]' id=\"rows\"></td>";

                }else if(fa==2){
                    tab+="<td class=\"success\"><input type=\"text\"  name='user"+i+"[]' id=\"rows\"></td>";

                }else if(fa==3){
                    tab+="<td class=\"warning\"><input type=\"text\"  name='user"+i+"[]' id=\"rows\"></td>";

                }else if(fa==4){
                    tab+="<td class=\"danger\"><input type=\"text\"  name='user"+i+"[]' id=\"rows\"></td>";

                }else{
                    fa=0;
                    tab+="<td class=\"info\"><input type=\"text\"  name='user"+i+"[]' id=\"rows\"></td>";
                }
            }
            tab+='</tr>';
            fa++;
        }tab+='</table><button type="submit" class="btn btn-success" style="display:block;margin:0 auto">开始计算!</button>';
        div1.innerHTML=tab
        $("#idd2").hide()
        $("#idd2").show(500);
    }

</script>
</div>
</body>
</html>

//前台jsp代码-2
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


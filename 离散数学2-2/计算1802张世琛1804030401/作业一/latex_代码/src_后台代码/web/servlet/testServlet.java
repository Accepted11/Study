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
//        System.out.println(s[0][2]);
//        for (int i = 0; i<=n; i++) {
//            for (int j = 0; j<=n; j++){
//                System.out.println(s[i][j]);
//            }
//        }
//        String user0 = request.getParameter("user0[]");
//        System.out.println(user0);
  //      s[0]= request.getParameterValues("user"+0+"[]");
//        System.out.println(s[0][0]);
//        System.out.println(s[0][1]);
//        System.out.println(s[0][2]);
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
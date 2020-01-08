import java.util.*;

public class Main {
    static public void main(String[] argc) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        Scanner cin = new Scanner(System.in);
        String[][] s = new String[1000][1000];
        int n = cin.nextInt();
        for (int i = 0; i <= n; i++) {
            for (int j = 0; j <= n; j++) {
                s[i][j] = cin.next();
            }
        }
        for (int i = 1; i <= n; i++) {
            map.put(s[0][i], i);
        }
        int flag = 0;
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                for (int k = 1; k <= n; k++) {
                    if (map.get(s[i][map.get(s[j][k]).intValue()]).intValue() != map.get(s[map.get(s[i][j]).intValue()][k]).intValue()) {
                        flag = 1;
                        break;
                    }
                }
                if (flag == 1) break;
            }
            if (flag == 1) break;
        }
        if (flag == 0) System.out.println("是半群");
        else System.out.println("不是半群");

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
            System.out.println("不是独异点");
            flag = 1;
        } else {
            int cnt = 0;
            for (int i = 1; i <= n; i++) {
                if (s[i][0].equals(s[i][k])) {
                    cnt++;
                }
            }
            if (cnt == n) {
                System.out.println("是独异点");
            } else {
                flag = 1;
                System.out.println("不是独异点");
            }
        }
        if (flag == 1) {
            System.out.println("不是群");
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
                System.out.println("是群");
            } else {
                System.out.println("不是群");
            }
        }
    }
}

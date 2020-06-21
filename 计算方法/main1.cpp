#include<bits/stdc++.h>
using namespace std;
const int maxn=100+10;
const double eps=1e-6;
double a[1000][1000];
int n,m;
int main() {
    n = 4;
    m = n + 1;
    a[1][1] = 0.4;
    a[2][1] =0.55;
    a[3][1] =0.65;
    a[4][1] =0.8;
    a[1][2] = 0.4111;
    a[2][2] =0.578;
    a[3][2] =0.697;
    a[4][2] =0.888;
    //a[4][2] = 19;
//    for (int i = 1; i <= n; i++) {
//        a[i][2] = sqrt(a[i][1]);
//    }
    for (int j = 3; j <= m; j++) {
        for (int i = j - 1; i <= n; i++) {
            a[i][j] = (a[i][j - 1] - a[i - 1][j - 1]) / (a[i][1] - a[i - (j - 2)][1]);
        }
    }
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            cout << fixed << setprecision(5) << a[i][j];
            if (j == m)cout << endl; else cout << " ";
        }
    }

    double x = 0.596, ans = a[1][2];
    for (int i = 2; i <= 3; i++) {
        double k = a[i][i + 1];
        for (int j = 1; j < i; j++) {
            k *= (x - a[j][1]);
        }
        //cout << fixed << setprecision(5) <<k<<endl;
        ans += k;
    }
    printf("\n%.7lf\n",ans);
}

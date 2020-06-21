#include <bits/stdc++.h>
using namespace std;
double f_Runge(double x,double y) {
    return x+y;
}
void Runge_Kutta_jing() {
    double h = 0.2, x = 0, y = 1;
    for (int i = 1; i <= 7; i++) {
        double k1 = h * f_Runge(x, y);
        double k2 = h * f_Runge(x + h / 2, y + k1 / 2);
        double k3 = h * f_Runge(x + h / 2, y + k2 / 2);
        double k4 = h * f_Runge(x + h, y + k3);
        printf("i=%d x=%7.7lf y=%7.7lf ", i - 1, x, y);
        x = x + h;
        y = y + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
        printf("k1=%7.7lf k2=%7.7lf k3=%7.7lf k4=%7.7lf x'=%7.7lf y'=%7.7lf\n\n", k1, k2, k3, k4, x, y);
    }
}
double f_Euler(double x,double y) {
    return y-2*x;
}
void Euler() {
    printf("Euler\n");
    double h = 0.2, x = 0, y = 1;
    for (int i = 1; i <= 5; i++) {
        printf("i=%d  x=%9.5lf  y=%9.5lf  ", i - 1, x, y);
        y = y + h * f_Euler(x, y);
        x = x + h;
        printf("x'=%9.5lf  y'=%9.5lf\n\n", x, y);
    }
}
void Euler_gai() {
    printf("Euler_gai\n");
    double h = 0.1, x = 0, y = 1;
    for (int i = 1; i <= 5; i++) {
        printf("i=%4d  x=%9.5lf  y=%9.5lf  ", i - 1, x, y);
        double k1 = f_Euler(x, y);
        double k2 = f_Euler(x + h, y + h * k1);
        y = y + h * (k1 + k2) / 2;
        x = x + h;
        printf("k1=%9.5lf  k2=%9.5lf  x'=%9.5lf  y'=%9.5lf\n\n", k1, k2, x, y);
    }
}
void Jacobi() {
    double a[100][100] = {0}, b[100] = {0};
    int n;
    double x[100] = {0}, x1[100] = {0};
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n + 1; j++) {
            if (j <= n) scanf("%lf", &a[i][j]); else scanf("%lf", &b[i]);
        }
    }
    for (int i = 1; i <= n; i++) {
        scanf("%lf", &x[i]);
    }
    for (int i = 1; i <= 6; i++) {
        printf("i=%d\n",i-1);
        for (int j = 1; j <= n; j++) {
            printf("x%d=%.5lf  ",j,x[j]);
        }
        printf("\n");
        for (int j = 1; j <= n; j++) {
            double sum = b[j];
            for (int k = 1; k <= n; k++) {
                if (j != k) {
                    sum -= a[j][k] * x[k];
                }
            }
            x1[j] = sum / a[j][j];
        }
        for (int j = 1; j <= n; j++) {
            x[j] = x1[j];
        }
    }
}
void Gauss_Seidel() {
    double a[100][100] = {0}, b[100] = {0};
    int n;
    double x[100] = {0}, x1[100] = {0};
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n + 1; j++) {
            if (j <= n) scanf("%lf", &a[i][j]); else scanf("%lf", &b[i]);
        }
    }
    for (int i = 1; i <= n; i++) {
        scanf("%lf", &x[i]);
    }
    for (int i = 1; i <= 6; i++) {
        printf("i=%d\n", i - 1);
        for (int j = 1; j <= n; j++) {
            printf("x%d=%.5lf  ", j, x[j]);
        }
        printf("\n");
        for (int j = 1; j <= n; j++) {
            double sum = b[j];
            for (int k = 1; k <= n; k++) {
                if (j != k) {
                    if (k < j) sum -= a[j][k] * x1[k]; else sum -= a[j][k] * x[k];
                }
            }
            x1[j] = sum / a[j][j];
        }
        for (int j = 1; j <= n; j++) {
            x[j] = x1[j];
        }
    }
}
void nihe() {
    int n;
    scanf("%d", &n);
    double x[100] = {0}, y[100] = {0}, sumy=0, sumxy=0, sumx=0, sumx2=0;
    for (int i = 1; i <= n; i++) {
        scanf("%lf%lf", &x[i], &y[i]);
        y[i] = log(y[i]);
        printf("%.5lf\n",y[i]);
        sumx += x[i];
        sumx2 += x[i] * x[i];
        sumy += y[i];
        sumxy += x[i] * y[i];
    }
    printf("sumx=%lf  sumx2=%.7lf  sumy=%lf  sumxy=%lf\n", sumx, sumx2, sumy, sumxy);
}
const double eps=1e-8;
double f_erfen(double x) {
    return x * x * x + x * x - 3 * x - 3;
}
int sign(double x) {
    if (fabs(x) < eps) return 0;
    if (x > 0) return 1;
    return -1;
}
void erfen() {
    double l = 1, r = 2;
    int k = 0;
    while (1) {
        double mid = (l + r) / 2;
        k++;
        printf("k=%d l=%7.7lf r=%7.7lf mid=%7.7lf f(mid)=%7.7lf\n", k, l, r, mid, f_erfen(mid));
        if (fabs(r - l)/2< 0.001) break;
        if (sign(f_erfen(l) * f_erfen(mid)) < 0) {
            r = mid;
        } else l = mid;
    }
}
void diedai() {
    double x = 2;
    int k = 0;
    printf("i=0 x=%.7lf\n", x);
    while (1) {
        k++;
        double x1 = x - (x * x * x*x - 3 * x*x +x- 2) / (4 * x*x * x -6*x+1);
        printf("i=%d x=%.4lf\n", k, x1);
        if (fabs(x1 - x) < 0.00005) break;
        x = x1;
    }
}
double f_gexian(double x) {
    return x*x*x-3*x-1;
}
void gexianfa() {
    double x0 = 2, x1 = 1.9;
    printf("i=%d  %.7lf\n",0,x0);
    printf("i=%d  %.7lf\n",1,x1);
    for (int i = 1; i <= 100; i++) {
        double x2 = x1 - f_gexian(x1) / (f_gexian(x1) - f_gexian(x0)) * (x1 - x0);
        x0 = x1;
        x1 = x2;
        printf("i=%d  %.7lf\n",i+1,x1);
        if (fabs(x1-x0)<0.0001) break;
    }
}
void Doolittle() {
    int n;
    double a[100][100];
    double L[100][100], U[100][100];
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            scanf("%lf", &a[i][j]);
        }
        L[i][i] = 1;
    }
    for (int j = 1; j <= n; j++) {
        U[1][j] = a[1][j];
    }
    for (int i = 1; i <= n; i++) {
        L[i][1] = a[i][1] / U[1][1];
    }
    for (int k = 2; k <= n; k++) {
        for (int j = k; j <= n; j++) {
            double sum = 0;
            for (int kk = 1; kk < j; kk++) {
                sum += L[k][kk] * U[kk][j];
            }
            U[k][j] = a[k][j] - sum;
        }
        for (int j = k + 1; j <= n; j++) {
            double sum = 0;
            for (int kk = 1; kk < j; kk++) {
                sum += L[j][kk] * U[kk][k];
            }
            L[j][k] = (a[j][k] - sum) / U[k][k];
        }
    }
    printf("L:\n");
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            printf("%.7lf  ", L[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    printf("U:\n");
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            printf("%.7lf  ", U[i][j]);
        }
        printf("\n");
    }
}
void zhunganfaCrout() {
    int n;
    double a[100][100];
    double L[100][100], U[100][100];
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            scanf("%lf", &a[i][j]);
        }
        U[i][i] = 1;
    }
    L[1][1] = a[1][1];
    U[1][2] = a[1][2] / L[1][1];
    for (int i = 2; i <= n; i++) {
        L[i][i - 1] = a[i][i - 1];
        L[i][i] = a[i][i] - L[i][i - 1] * U[i - 1][i];
        U[i][i + 1] = a[i][i + 1] / L[i][i];
    }
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            printf("%.7lf  ", L[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            printf("%.7lf  ", U[i][j]);
        }
        printf("\n");
    }
}
void jiasu_diedai() {
    double x = 0.5;
    double L = -0.6;
    int k = 0;
    printf("i=0 x=%.7lf\n", x);
    while (1) {
        k++;
        double x1 = exp(-x);
        double x2 = x1 +L* (x1 - x) / (1-L);
        printf("i=%d x=%.7lf\n", k, x2);
        if (fabs(x2 - x) < 0.00005) break;
        x = x2;
    }
}
void sanci() {
    double lambda[100] = {0}, mu[100] = {0}, d[100] = {0}, h[100] = {0};
    double x[100] = {0}, y[100] = {0};
    int n;
    scanf("%d", &n);
    for (int i = 0; i <= n; i++) {
        scanf("%lf%lf", &x[i], &y[i]);
    }
    for (int i = 1; i <= n; i++) {
        h[i] = x[i] - x[i - 1];
    }
    int flag;
    scanf("%d", &flag);
    if (flag == 1) {
        double y0, yn;
        scanf("%lf%lf", &y0, &yn);
        lambda[0] = mu[n] = 1;
        d[0] = 6 * ((y[0] - y[1]) / (x[0] - x[1]) - y0) / h[1];
        d[n] = 6 * (yn - (y[n - 1] - y[n]) / (x[n - 1] - x[n])) / h[n];
    }
    if (flag == 2) {
        double y0, yn;
        scanf("%lf%lf", &y0, &yn);
        lambda[0] = mu[n] = 0;
        d[0] = 2 * y0;
        d[n] = 2 * yn;
    }
    for (int i = 1; i < n; i++) {
        lambda[i] = h[i + 1] / (h[i] + h[i + 1]);
        mu[i] = 1 - lambda[i];
        d[i] = 6 * ((y[i + 1] - y[i]) / h[i + 1] - (y[i] - y[i - 1]) / h[i]) / (h[i] + h[i + 1]);
    }
    for (int i = 0; i <= n; i++) {
        for (int j = 0; j <= n; j++) {
            if (i == j - 1) printf("%7.5lf ", lambda[i]);
            else if (i == j) printf("%7.5lf ", 2.0);
            else if (i == j + 1) printf("%7.5lf ", mu[i]); else printf("%7.5lf ", 0.0);
        }
        printf("%7.5lf\n", d[i]);
    }
}
void xianxingchazhi() {
    double x0, y0, x1, yy, x;
    scanf("%lf%lf", &x0, &y0);
    scanf("%lf%lf", &x1, &yy);
    scanf("%lf", &x);
    double l0 = (x - x1) / (x0 - x1);
    double l1 = (x - x0) / (x1 - x0);
    double L1 = l0 * y0 + yy * l1;
    printf("%.7lf\n", L1);
}

void paowuxianchazhi() {
    double x0, y0, x1, yy, x, x2, y2;
    scanf("%lf%lf", &x0, &y0);
    scanf("%lf%lf", &x1, &yy);
    scanf("%lf%lf", &x2, &y2);
    scanf("%lf", &x);
    double l0 = ((x - x1) * (x - x2)) / ((x0 - x1) * (x0 - x2));
    double l1 = ((x - x0) * (x - x2)) / ((x1 - x0) * (x1 - x2));
    double l2 = ((x - x0) * (x - x1)) / ((x2 - x0) * (x2 - x1));
    double L1 = l0 * y0 + yy * l1 + y2 * l2;
    printf("%.7lf\n", L1);
}
void Lagrange() {
    int n;
    double x[100], ans=0, y[100], xx, l[100];
    scanf("%d", &n);
    for (int i = 0; i <= n; i++) {
        scanf("%lf%lf", &x[i], &y[i]);
    }
    scanf("%lf", &xx);
    for (int i = 0; i <= n; i++) {
        double sum1 = 1;
        double sum2 = 1;
        for (int j = 0; j <= n; j++) {
            if (j != i) {
                sum1 *= (xx - x[j]);
                sum2 *= (x[i] - x[j]);
            }
        }
        l[i] = sum1 / sum2;

        printf("%.5lf\n",l[i]);
        ans += l[i] * y[i];
    }
    printf("%.7lf\n", ans);
}
double f_tixing(double x) {
    return sqrt(x);
}
void fuhuatixinggongshi() {
    double a = 1, b = 9;
    int n = 4;
    double h = (b - a) / n;
    double ans = f_tixing(a) + f_tixing(b);
    for (int i = 1; i < n; i++) {
        ans += f_tixing(a + h * i) * 2;
    }
    ans = ans * h / 2;
    printf("%.6f\n", ans);
}
double f_Simpson(double x) {
    return sqrt(x);
}
void fuhuaSimpson() {
    double a = 1, b = 9;
    int n = 4;
    double nn = n / 2;
    double h = (b - a) / nn;
    double ans = f_Simpson(a) + f_Simpson(b);
    for (int i = 0; i < nn; i++) {
        ans += f_Simpson(a + h * i + h / 2) * 4;
    }
    for (int i = 1; i < nn; i++) {
        ans += f_Simpson(a + h * i) * 2;
    }
    ans = ans * h / 6;
    printf("%.6f\n", ans);
}

const double pi=acos(-1);
double f_bian(double x) {
    return 2 / sqrt(pi)*exp(-x);
}
void bianbuchang() {
    double a = 0, b = 1;
    double t[100] = {0};
    double h = b - a;
    double n = 1;
    t[1] = (f_bian(a) + f_bian(b)) * h / 2;
    for (int i = 1; i <= 8; i *= 2) {
        t[i * 2] = t[i] / 2;
        for (int k = 0; k < i; k++) {
            t[i * 2] += h * f_bian(a + h * k + h / 2) / 2;
        }
        h = h / 2;
    }
    double s[100], r[100], c[100];
    for (int i = 1; i <= 4; i *= 2) {
        s[i] = (4 * t[i * 2] - t[i]) / (4 - 1);
    }
    for (int i = 1; i <= 2; i *= 2) {
        c[i] = (4 * 4 * s[i * 2] - s[i]) / (4 * 4 - 1);
    }
    for (int i = 1; i <= 1; i *= 2) {
        r[i] = (4 * 4 * 4 * c[i * 2] - c[i]) / (4 * 4 * 4 - 1);
    }
    printf("\nt: ");
    for (int i = 1; i <= 8; i *= 2) printf("%.7lf   ", t[i]);
    printf("\ns: ");
    for (int i = 1; i <= 4; i *= 2) printf("%.7lf   ", s[i]);
    printf("\nc: ");
    for (int i = 1; i <= 2; i *= 2) printf("%.7lf   ", c[i]);
    printf("\nr: ");
    for (int i = 1; i <= 1; i *= 2) printf("%.7lf   ", r[i]);
    printf("\n");
    //printf("%.7lf\n", r[1]);
}
void Crout() {
    int n;
    int i, j, k;
    int mi;
    double mx, tmp;
    static double a[100][100], b[100], x[100], y[100];//方程组Ly=b和Ux=y
    static double l[100][100], u[100][100]; //l是矩阵L,u是矩阵U
    scanf("%d", &n);
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
            scanf("%lf", &a[i][j]);
    for (i = 0; i < n; i++)
        u[i][i] = 1;
    for (k = 0; k < n; k++) {
        for (i = k; i < n; i++) {
            l[i][k] = a[i][k];
            for (j = 0; j <= k - 1; j++)
                l[i][k] -= (l[i][j] * u[j][k]);
        }
        for (j = k + 1; j < n; j++) {
            u[k][j] = a[k][j];
            for (i = 0; i <= k - 1; i++)
                u[k][j] -= (l[k][i] * u[i][j]);
            u[k][j] /= l[k][k];
        }
    }
    printf("L:\n");
    for (i = 0; i < n; i++) {
        printf("[");
        for (j = 0; j < n; j++) {
            printf("%lf ", l[i][j]);
        }
        printf("]\n");
    }
    printf("U:\n");
    for (i = 0; i < n; i++) {
        printf("[");
        for (j = 0; j < n; j++) {
            printf("%lf ", u[i][j]);
        }
        printf("]\n");
    }
}
int main() {
    //freopen("1.txt","r",stdin);
    double x=0.351547;
    //printf("%lf\n",(x-0.32)*(x-0.34)*(x-0.36));
    //printf("%.10f",cos(0.32)*0.000003/6);
    //printf("%.10lf",sin(0.3367));
    //freopen("1.txt", "w", stdout);
    //printf("%.5lf\n",exp(1.332));
    //Euler();
    //Euler_gai();
    //printf("%.3lf",0.25*(4*(0.1247+0.3663+0.5851+0.7675)+2*(0.2474+0.4794+0.6816)+0.8415)/6);
    //Runge_Kutta_jing();
    //erfen();
    //Jacobi();
    //Gauss_Seidel();
    //nihe();
    //diedai();
    //gexianfa();
    //jiasu_diedai();
    //work();
    //sanci();
    //Doolittle();
    Crout();
    //xianxingchazhi();
    //paowuxianchazhi();
    Lagrange();
    //printf("%.5lf\n",sin(0.3367));
    //fuhuatixinggongshi();
    //fuhuaSimpson();
    //bianbuchang();

}
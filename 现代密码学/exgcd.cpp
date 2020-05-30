#pragma GCC optimize(3,"Ofast","inline")
#include <bits/stdc++.h>
using namespace std;
void exgcd(int a,int b,int &d,int &x,int &y) {
    if (!b) {
        x = 1;
        y = 0;
        d = a;
        return;
    }
    exgcd(b, a % b, d, y, x);
    y -= a / b * x;
}
int pow_mod(int a,int b,int mod) {
    int res = 1;
    while (b) {
        if (b & 1) res = res * a % mod;
        a = a * a % mod;
        b >>= 1;
    }
    return res;
}
void work2(){
    int p = 257;
    int c2 = 147;
    int c1 = 74;
    int xx = 29;
    int d, x, y;
    exgcd(pow_mod(c1, xx, p), p, d, x, y);
    printf("%d\n", c2 * (x % p + p) % p);
}
void work1() {
    int p = 257;
    int m = 117;
    int y = 69;
    int k = 37;
    int g = 3;
    printf("%d %d\n", pow_mod(g, k, p), pow_mod(y, k, p) * m % p);
}
int main() {
    work1();
    work2();
}
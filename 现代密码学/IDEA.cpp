#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
const ll mod=1<<16;
string m1,m2,m3,m4;
string z1,z3,z4,z2;
ll num;
ll f(string str) {
    ll res = 0;
    for (int i = 0; i < str.length(); i++) {
        res = res * 2 + str[i] - '0';
    }
    return res;
}
void print(ll num) {
    int a[1000]={0}, tot = 0;
    while (num) {
        a[tot++] = num % 2;
        num >>= 1;
    }
    for (int i = 15; i >= 0; i--) printf("%d", a[i]);
    printf("\n");
}
int main() {
    cin >> m1 >> m2 >> m3 >> m4;
    cin >> z1 >> z2 >> z3 >> z4;
    num = f(m1) * f(z1) % (mod + 1);
    if (num == 0) print(mod); else print(num);

    num = (f(m2) + f(z2)) % mod;
    print(num);

    num = f(m3) + f(z3) % mod;
    print(num);
    num = (f(m4) * f(z4)) % (mod + 1);
    if (num == 0) print(mod); else print(num);
}

/*
0000000100000001
1000000000000001
1000000000000101
0000000100000011
0000000100000011
1000000000000101
1000000000000001
0000000100000001


0000010000000010
0000000000000110
0000000000000110
0000010000000010
 */
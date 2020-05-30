#pragma GCC optimize(3,"Ofast","inline")
#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
ll p,q,m,n,e;
ll pow_mod(ll a,ll b) {
    ll res = 1;
    while (b) {
        if (b & 1) res = res * a % n;
        a = a * a % n;
        b >>= 1;
    }
    return res;
}
int main() {
    cin >> p >> q >> e >> m;
    n = p * q;
    cout << pow_mod(m, e) << endl;
}
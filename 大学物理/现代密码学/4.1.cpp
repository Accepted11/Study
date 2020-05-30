#pragma GCC optimize(3,"Ofast","inline")
#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
void exgcd(ll a,ll b,ll &d,ll &x,ll &y) {
    if (!b) {
        x = 1;
        y = 0;
        d = a;
        return;
    }
    exgcd(b, a % b, d, y, x);
    y -= a / b * x;
}
int main() {
    ll p, q, e;
    cin >> p >> q >> e;
    ll d, x, y;
    ll phi = (p - 1) * (q - 1);
    exgcd(e, phi, d, x, y);
    printf("%lld\n", (x % phi + phi) % phi);
}
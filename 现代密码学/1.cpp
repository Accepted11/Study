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
ll pow_mod(ll a,ll b,ll mod) {
    ll res = 1;
    while (b) {
        if (b & 1) res = res * a % mod;
        a = a * a % mod;
        b >>= 1;
    }
    return res;
}
void ElGamal() {
    printf("---------------------------\n");
    ll p = 2579;
    ll m = 1299;
    ll x=765;
    ll k = 853;
    ll g = 2;
    ll y = pow_mod(g,x,p);
    printf("c1=%lld c2=%lld\n", pow_mod(g, k, p), pow_mod(y, k, p) * m % p);
    ll c1 = 435;
    ll c2 = 2396;
    ll d, xx, yy;
    exgcd(pow_mod(c1, x, p), p, d, xx, yy);
    printf("m=%lld\n", c2 * (xx % p + p) % p);
    printf("---------------------------\n");
}
void RSA() {
    printf("---------------------------\n");
    ll p = 7;
    ll q =11;
    ll e = 13;
    ll d, x, y;
    ll phi = (p - 1) * (q - 1);
    exgcd(e, phi, d, x, y);
    d = (x % phi + phi) % phi;
    printf("d=%d\n", d);
    ll n = p * q;
    ll m = 115;
    ll c = 41;
    //printf("c=%d\n", pow_mod(m, e, n));
    printf("m=%d\n", pow_mod(c, d, n));
    printf("---------------------------\n");
}
void Rabin() {
    printf("---------------------------\n");
    ll p = 19;
    ll q = 23;
    ll n = p * q;
    ll c = 123;
    ll x1 = pow_mod(c, (p + 1) / 4, p);
    ll x2 = p - x1;
    ll yy = pow_mod(c, (q + 1) / 4, q);
    ll y2 = q - yy;
    ll d, x, y;
    exgcd(q, p, d, x, y);
    ll a = q * ((x % p + p) % p);
    ll b = p * ((y % q + q) % q);
    printf("%lld\n", (a * x1 + b * yy) % n);
    printf("%lld\n", (a * x1 + b * y2) % n);
    printf("%lld\n", (a * x2 + b * yy) % n);
    printf("%lld\n", (a * x2 + b * y2) % n);
    printf("---------------------------\n");
}
void Beibao() {
    printf("---------------------------\n");
    //freopen("1.txt","r",stdin);
    ll n;
    ll a[1000] = {0}, b[100] = {0};
    scanf("%d", &n);
    for (ll i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
    ll M = 383;
    ll u = 311;
    for (ll i = 0; i < n; i++) {
        b[i] = a[i] * u % M;
        cout << b[i] << " ";
    }
    printf("\n");
    ll d, x, y;
    exgcd(u, M, d, x, y);
    ll invu = (x % M + M) % M;
    printf("%d\n", invu);
    ll m = 23;
    ll num = 0, c = 0;
    while (m) {
        num++;
        if (m & 1) {
            c += b[n - num];
        }
        m >>= 1;
    }
   // cout << c << endl;
    c = 517;
    ll C = c * invu % M;
    num = 1;
    for (ll i = n - 1; i >= 0; i--) {
        if (a[i] <= C) {
            m += num;
            C -= a[i];
        }
        num = num * 2;
    }
    cout << m << endl;
    printf("---------------------------\n");
}
void NUMRSA() {
    ll p = 839;
    ll q = 983;
    ll n = p * q;
    ll phi = (p - 1) * (q - 1);
    ll d = 132111;
    ll D, x, y;
    exgcd(d, phi, D, x, y);
    cout << "e=" << (x % phi + phi) % phi << endl;
    ll m = 23547;
    cout << pow_mod(m, d, n) << endl;
}
void NUMRSA1() {
    ll n = 824737;
    ll e = 26959;
    ll y = 8798;
    cout << pow_mod(y, e, n) << endl;
    ll x = 167058;
    y = 366314;
    if (x == pow_mod(y, e, n)) puts("YES"); else puts("NO");
}
void NUMElGamal() {
    ll p = 19;
    ll g = 13;
    ll x = 10;
    ll y = pow_mod(g, x, p);
    ll M = 15;
    ll k = 11;
    ll r = pow_mod(g, k, p);
    ll D, X, Y;
    exgcd(k, p - 1, D, X, Y);
    ll invk = (X % (p - 1) + p - 1) % (p - 1);
    ll s = ((M - x * r) * invk % (p - 1) + p - 1) % (p - 1);
    cout << r << " " << s << endl;
    r = 2;
    s = 11;
    if (pow_mod(y, r, p) * pow_mod(r, s, p) % p == pow_mod(g, M, p)) puts("YES"); else puts("NO");
}
void NUMDSS() {
    ll p = 83;
    ll q = 41;
    ll h = 2;
    ll g = pow_mod(h, (p - 1) / q, p);
    cout << g << endl;
    ll x = 57;
    ll y = pow_mod(g, x, p);
    cout << y << endl;
    ll k = 23;
    ll r = pow_mod(g, k, p) % q;
    ll D, X, Y;
    exgcd(k, q, D, X, Y);
    ll invk = (X % q + q) % q;
    ll M = 56;
    ll s = invk * (M + x * r) % q;
    cout << r << " " << s << endl;
    r = 10;
    s = 29;
    M = 56;
    exgcd(s, q, D, X, Y);
    ll invs = (X % q + q) % q;
    ll w = invs;
    ll u1 = M * w % q;
    ll u2 = r * w % q;
    ll v = pow_mod(g, u1, p) * pow_mod(y, u2, p) % p % q;
    if (r == v) puts("YES"); else puts("NO");
}
void NUMDSS1(){
    ll r = 12;
    ll s = 18;
    ll M = 19;
    ll g=25;
    ll y=8;
    ll p=47;
    ll q=23;
    ll D, X, Y;
    exgcd(s, q, D, X, Y);
    ll invs = (X % q + q) % q;
    ll w = invs;
    ll u1 = M * w % q;
    ll u2 = r * w % q;
    ll v = pow_mod(g, u1, p) * pow_mod(y, u2, p) % p % q;
    if (r == v) puts("YES"); else puts("NO");
}
void miyaoduanyu(){
    string str;
    int tot=0;
    map<char,char>ma,ma1;
    int a[1000]={0};
    string ming,mi;
    getline(cin, str);
    for (int i = 0; i < str.length(); i++) {
        if (((str[i]>='a'&&str[i]<='z')||(str[i]>='A'&&str[i]<='Z'))&&ma[str[i]] == 0) {
            ma[str[i]] = tot + 'a';
            ma1[tot + 'a'] = str[i];
            tot++;
        }
    }
    for (int i = 0; i < 26; i++) {
        if (ma[i + 'a'] == 0) {
            ma[i + 'a'] = tot + 'a';
            ma1[tot + 'a'] = i + 'a';
            tot++;
        }
    }
    cin >> ming;
    for (int i = 0; i < ming.length(); i++) {
        printf("%c", ma1[ming[i]]);
    }
    printf("\n");
    cin >> mi;
    for (int i = 0; i < mi.length(); i++) {
        printf("%c", ma[mi[i]]);
    }
}
void inv(){
    string str;
    int a[1000]={0};
    int tot=0;
    cin >> str;
    for (int i = str.length() - 1; i >= 0; i--) {
        a[tot++] = str[i] - '0';
    }
    for (int i = 0; i < 1 << 8; i++) {
        int b[1000] = {0}, c[100] = {0};
        for (int j = 0; j < 8; j++) {
            if (i >> j & 1) {
                b[j] = 1;
            }
        }
        for (int j = 0; j < 8; j++) {
            if (a[j] == 1)
                for (int k = 0; k < 8; k++) {
                    if (b[k] == 1)
                        c[j + k] = (c[j + k] + 1) % 2;
                }
        }
        for (int j = 16; j >= 8; j--) {
            if (c[j] == 1) {
                c[j] = 0;
                c[j - 4] = (c[j - 4] + 1) % 2;
                c[j - 5] = (c[j - 5] + 1) % 2;
                c[j - 7] = (c[j - 7] + 1) % 2;
                c[j - 8] = (c[j - 8] + 1) % 2;
            }
        }
        int flag = 0;
        for (int j = 16; j >= 1; j--) {
            if (c[j] == 1) flag = 1;
        }
        if (flag == 0 && c[0] == 1) {
            for (int j = 7; j >= 0; j--) {
                printf("%d", b[j]);
            }
            printf("\n");
        }
    }
}
const ll mod=1<<16;
ll num;
ll f(string str) {
    ll res = 0;
    for (int i = 0; i < str.length(); i++) {
        res = res * 2 + str[i] - '0';
    }
    return res;
}
string print(ll num) {
    string res = "";
    int a[1000] = {}, tot = 0;
    while (num) {
        a[tot++] = num % 2;
        num >>= 1;
    }
    for (int i = 15; i >= 0; i--) res += char(a[i] + '0');
    return res;
}
string cheng(string str1,string str2) {
    num = f(str1) * f(str2) % (mod + 1);
    if (num == 0) return print(mod); else return print(num);
}
string jia(string str1,string str2) {
    num = (f(str2) + f(str1)) % mod;
    return print(num);
}
string yihuo(string str1,string str2) {
    string res = "";
    for (int i = 0; i < str1.length(); i++) {
        if (str1[i] != str2[i]) res += '1'; else res += '0';
    }
    return res;
}
void IDEA() {
    string str1, str2, str;
    freopen("1.txt", "r", stdin);
    cin >> str1 >> str2 >> str;
    if (str == "*") cout<<cheng(str1, str2)<<endl;
    if (str == "++") cout<<jia(str1, str2)<<endl;
    if (str == "+") cout<<yihuo(str1, str2)<<endl;
}
void IDEA1() {
    string m1, m2, m3, m4;
    string z1, z2, z4, z3;
    cin >> m1 >> m2 >> m3 >> m4;
    cin >> z1 >> z2 >> z3 >> z4;
    cout << cheng(m1, z1) << endl;
    cout << jia(m2, z2) << endl;
    cout << jia(m3, z3) << endl;
    cout << cheng(m4, z4) << endl;
}
ll pow1(ll a,ll b) {
    ll res = 1;
    while (b) {
        if (b & 1) res = res * a;
        a = a * a;
        b >>= 1;
    }
    return res;
}
void R(){
    string str;
    cin>>str;
    int len=str.length();
    for (int i=0;i<len;i++){
        int res=0;
        for (int j=0;j<len;j++){
            res+=pow1(-1,str[j]-'0'+str[(j+i)%len]-'0');
        }
        cout<<res<<" ";
    }
}
void fenxi() {
    ll g = 5;
    ll p = 31847;
    ll M1 = 8990;
    ll r = 23972;
    ll s1 = 31396;
    ll M2 =31415;
    ll s2 = 20481;
    ll d = __gcd(s1 - s2, p - 1);
    ll M = (M1 - M2) / d;
    ll P = (p - 1) / d;
    ll S = (s1 - s2) / d;
    ll D, X, Y;
    exgcd(S, P, D, X, Y);
    ll invs = (X % P + P) % P;
    ll k = 0;
    for (int i = -1000000; i <= 1000000; i++) {
        ll xx = M * invs + i * P;
        if (xx >= 0 && xx <= p - 1) {
            if (pow_mod(g, xx, p) == r) {
                k = xx;
            }
        }
    }
    ll y = 25703;
    cout << k << endl;
    for (int x = 1; x <= p - 2; x++) {
        if ((s1 * k % (p - 1) + p - 1) % (p - 1) == ((M1 - x * r) % (p - 1) + p - 1) % (p - 1) &&
            y == pow_mod(g, x, p)) {
            printf("%d\n", x);
        }
    }
}
void mul() {
    string str1, str2;
    cin >> str1 >> str2;
    int a[1000] = {}, b[1000] = {}, c[100] = {};
    for (int i = 0; i < str1.length(); i++) {
        a[str1.length() - i - 1] = str1[i] - '0';
        b[str1.length() - i - 1] = str2[i] - '0';
    }
    for (int i = 0; i < 8; i++) {
        if (a[i] == 1)
            for (int j = 0; j < 8; j++) {
                if (b[j] == 1) {
                    c[i + j] = (c[i + j] + 1) % 2;
                }
            }
    }
    for (int j = 16; j >= 8; j--) {
        if (c[j] == 1) {
            c[j] = 0;
            c[j - 4] = (c[j - 4] + 1) % 2;
            c[j - 5] = (c[j - 5] + 1) % 2;
            c[j - 7] = (c[j - 7] + 1) % 2;
            c[j - 8] = (c[j - 8] + 1) % 2;
        }
    }
    for (int j = 7; j >= 0; j--) {
        cout << c[j];
    }
    cout << endl;
}
void IDEA2() {
    freopen("1.txt", "r", stdin);
    string m1, m2, m3, m4;
    string z1, z2, z3, z4, z5, z6;
    z5 = "0000101011011011";
    z6 = "0000110100101101";
    string a = "1001110010100110";
    string b = "1111101011011011";
    string c = "1010101000110010";
    string d = "1110010010100101";
    // cout << a << endl << b << endl << c << endl << d << endl;
    string e = yihuo(a, c);
    string f = yihuo(b, d);
    //cout<<e<<endl<<f<<endl;
    string u = cheng(jia(cheng(e, z5), f), z6);
    string v = jia(u, cheng(e, z5));
    //cout << u << endl << v << endl;
    string w1 = yihuo(a, u);
    string w2 = yihuo(b, v);
    string w3 = yihuo(c, u);
    string w4 = yihuo(d, v);
    cout << w1 << endl << w2 << endl << w3 << endl << w4 << endl;
}
void fiat() {
    int a[100] = {0}, b[100] = {0};
    int n = 35;
    int k = 4;
    for (int i = 1; i <= k; i++) {
        scanf("%d", &a[i]);
        ll D, X, Y;
        exgcd(a[i], n, D, X, Y);
        int inva = (X % n + n) % n;
        for (int j = 0; j < n; j++) {
            if (j * j % n == inva) {
                b[i] = j;
                break;
            }
        }
    }
    int t = 1;
    int r1 = 16;
    int R1 = r1 * r1 % n, tot = 0;
    int c[100] = {0};
    int RR=R1;
    while (R1) {
        if (R1 & 1) c[tot++] = 1;else c[tot++]=0;
        R1 >>= 1;
    }
    for (int i = tot - 1; i >= 0; i--) cout << c[i] << " ";
    cout << endl;
    int s1 = r1;
    for (int i = 0; i < tot; i++) {
        s1 = (s1 * pow_mod(b[i + 1], c[tot - i - 1], n)) % n;
    }
    cout << s1<<endl;
    R1=s1*s1;
    for (int i = 0; i < tot; i++) {
        R1 = (R1 * pow_mod(a[i + 1], c[tot - i - 1], n)) % n;
    }
    if (R1==RR) puts("Yes");else puts("No");
}
void work() {
    string str;
    cin>>str;
    for (int i=0;i<str.length();i++){
        cout<<char((19*(str[i]-'a')+7)%26+'a');
    }
}
int main() {
    //freopen("1.txt","r",stdin);
    //work();
    //ElGamal();
    //RSA();
    //Rabin();
    //Beibao();
    //NUMRSA();
    //NUMRSA1();
    //NUMElGamal();
    //NUMDSS();
    //NUMDSS1();
    //miyaoduanyu();
    inv();
//    IDEA();
    //IDEA1();
    //IDEA2();
//    mul();
    //R();
    //fenxi();
    //fiat();
}
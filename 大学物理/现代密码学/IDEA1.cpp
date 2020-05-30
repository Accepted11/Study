#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
const ll mod=1<<16;
ll num;
ll f(string str) {
    ll res = 0;
    for (int i = 0; i < str.length(); i++) {
        res = res * 2 + str[i] - '0';
    }
    return res;
}
void print(ll num) {
    int a[1000]={}, tot = 0;
    while (num) {
        a[tot++] = num % 2;
        num >>= 1;
    }
    for (int i = 15; i >= 0; i--) printf("%d", a[i]);
    printf("\n");
}
void cheng(string str1,string str2){
    num = f(str1) * f(str2) % (mod + 1);
    if (num == 0) print(mod); else print(num);
}
void jia(string str1,string str2) {
    num = (f(str2) + f(str1)) % mod;
    print(num);
}
void yihuo(string str1,string str2) {
    for (int i = 0; i < str1.length(); i++) {
        if (str1[i] != str2[i]) printf("1"); else printf("0");
    }
}
string str1,str2,str;
int main() {
    freopen("1.txt", "r", stdin);
    cin >> str1 >> str2 >> str;
    if (str == "*") cheng(str1, str2);
    if (str == "++") jia(str1, str2);
    if (str == "+") yihuo(str1, str2);
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


0101111111011011
1000101110011111
0001011000100111
1010010101010010
0010110010011011
0111001100111110
1000110000001101
0110000010011101
0000111011011100
0000110100111011
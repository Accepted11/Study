#include <bits/stdc++.h>
using namespace std;
string str;
int a[1000];
int tot;
void f(int a[]) {
    int c[1000] = {};
    int b[8][8] = {1, 1, 1, 1, 1, 0, 0, 0,
                   0, 1, 1, 1, 1, 1, 0, 0,
                   0, 0, 1, 1, 1, 1, 1, 0,
                   0, 0, 0, 1, 1, 1, 1, 1,
                   1, 0, 0, 0, 1, 1, 1, 1,
                   1, 1, 0, 0, 0, 1, 1, 1,
                   1, 1, 1, 0, 0, 0, 1, 1,
                   1, 1, 1, 1, 0, 0, 0, 1};
    for (int i = 0; i < 8; i++) {
        for (int k = 0; k < 8; k++) {
            c[i] = (c[i] + b[i][k] * a[k]) % 2;
        }
    }
    c[0] ^= 0;
    c[1] ^= 1;
    c[2] ^= 1;
    c[3] ^= 0;
    c[4] ^= 0;
    c[5] ^= 0;
    c[6] ^= 1;
    c[7] ^= 1;
    for (int i = 7; i >=0; i--) printf("%d", c[i]);
    printf("\n");
}
int main() {
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
            f(b);
            printf("\n");
        }
    }
}

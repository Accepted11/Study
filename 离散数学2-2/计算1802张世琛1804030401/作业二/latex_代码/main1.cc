#include <bits/stdc++.h>
using namespace std;
int n,m,s;

inline int random() {
    static int seed = s;
    return seed = (int)(seed*48271ll%2147483647);
}
set<int>to[100005];

int main() {
    scanf("%d %d",&n,&m);
    freopen("1.txt","w",stdout);
    srand(time(NULL));
    s=rand();
    printf("%d %d \n", n, m);
    for (int i = 1; i <= m; i++) {
        int u = random() % n + 1;
        int v = random() % n + 1;
        while (to[u].find(v) != to[u].end() || u == v||to[v].find(u)!=to[v].end()) {
            u = random() % n + 1;
            v = random() % n + 1;
        }
        printf("%d %d\n", u, v);
        to[u].insert(v);
        to[v].insert(u);
    }
}
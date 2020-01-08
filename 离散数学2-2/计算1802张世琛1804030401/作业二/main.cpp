#include<bits/stdc++.h>
using namespace std;
const int maxn=100010;
vector<int>E[maxn];
int n,flag,vis[maxn],m,ff,ans[maxn],deg[maxn];
void dfs(int u,int deep) {
    if (flag) return;
    if (deep == n + 1 && u == 1) {
        flag = 1;
        return;
    }
    for (auto v:E[u]) {
        if (!vis[v] || (deep == n && v == 1)) {
            vis[v] = 1;
            ans[deep] = u;
            dfs(v, deep + 1);
            vis[v] = 0;
        }
    }
}
int main() {
    //freopen("555.txt", "r", stdin);
    scanf("%d%d", &n, &m);
    for (int i = 1, u, v; i <= m; i++) {
        scanf("%d%d", &u, &v);
        deg[u]++;
        deg[v]++;
        E[u].emplace_back(v);
        E[v].emplace_back(u);
    }
    if (m == n * (n - 1) / 2) {
        printf("Yes\n");
        return 0;
    }
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            if (i != j) {
                if (deg[i] + deg[j] >= n) {

                } else {
                    ff = 1;
                }
            }
        }
    }
    if (ff == 0) {
        printf("Yes\n");
        return 0;
    }
    vis[1] = 1;
    dfs(1, 1);
    if (flag) {
        printf("Yes\n");
        for (int i = 1; i <= n; i++) {
            printf("%d ", ans[i]);
        }
        printf("\n");
    } else printf("No\n");
    return 0;
}
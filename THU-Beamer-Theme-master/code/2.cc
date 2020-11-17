void fun(int k) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            f[i][j] = min(f[i][j], f[i][k] + f[k][j]);
        }
    }
}
    read(n, m);
    memset(f, 0x3f, sizeof(f));
    for (int i = 0; i < n; i++) {
        read(a[i]);
        f[i][i] = 0;
    }
    for (int i = 1, u, v, w; i <= m; i++) {
        read(u, v, w);
        f[u][v] = f[v][u] = w;
    }

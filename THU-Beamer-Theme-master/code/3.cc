    for (int i = 1, u, v, w; i <= m; i++) {
        read(u, v, w);
        f[u][v] = f[v][u] = w;
    }
    int q, k = 0;
    read(q);
    while (q--) {
        int u, v, t;
        read(u, v, t);
        while (k < n && a[k] <= t) {
            fun(k);
            k++;
        }
        if (a[u] > t || a[v] > t) puts("-1");
        else {
            if (f[u][v] == inf) puts("-1"); else printf("%d\n", f[u][v]);
        }
    }
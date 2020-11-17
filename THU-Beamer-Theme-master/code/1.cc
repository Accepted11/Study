for (int k=0;k<n;k++)
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (f[i][j] > f[i][k] + f[k][j])
                  f[i][j] = f[j][i] = f[i][k] + f[k][j];


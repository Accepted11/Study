#pragma GCC optimize(3,"Ofast","inline")
#include <bits/stdc++.h>
using namespace std;
typedef pair<int,int> PII;
map<PII,int>ma;
vector<pair<PII,int> >v;
int x,y,z;
bool cmp(pair<PII,int>  a,pair<PII,int>  b) {
    return a.second > b.second;
}
int main() {
    freopen("1.in", "r", stdin);
    freopen("1.out", "w", stdout);
    while (~scanf("%d%d%d%d%d%d%d", &x, &y, &z, &z, &z, &z, &z)) {
        ma[make_pair(x, y)]++;
    }
    for (map<PII, int>::iterator it = ma.begin(); it != ma.end(); it++) {
        v.push_back(make_pair(it->first, it->second));
    }
    sort(v.begin(), v.end(), cmp);
    for (int i = 1; i < 20; i++) {
        cout << v[i].first.first << " " << v[i].first.second << " " << v[i].second << endl;
    }
}
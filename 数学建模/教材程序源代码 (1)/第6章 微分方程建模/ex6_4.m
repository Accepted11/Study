% syms t
% a=[2,1,3;0,2,-1;0,0,2];
% x0=[1;2;1];
% x=expm(a*t)*x0  %expm��������eΪ������ָ������
% pretty(x)

syms x(t) y(t) z(t)
X=[x;y;z];
A=[2,1,3;0,2,-1;0,0,2];
x0=[1;2;1];
[x,y,z]=dsolve(diff(X)==A*X, X(0)==x0)

x=[0.02 0.02 0.06 0.06 0.11 0.11 0.22 0.22 0.56 0.56 1.10 1.10];
y=[76 47 97 107 123 139 159 152 191 201 207 200];
%y=[67 51 84 86 98 115 131 124 144 158 160];%Î´´¦Àí

beta0=[195.8027 0.04841];
[beta,R,J]=nlinfit(x,y,'huaxue',beta0);
betaci=nlparci(beta,R,J);
beta,betaci

yy=beta(1)*x./(beta(2)+x);
plot(x,y,'o',x,yy,'+')
axis([0 1.2 40 220])

nlintool(x,y,'huaxue',beta)

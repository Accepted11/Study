clc
clear all
x1=[0.02 0.02 0.06 0.06 0.11 0.11 0.22 0.22 0.56 0.56 1.10];
y1=[67 51 84 86 98 115 131 124 144 158 160];%未处理
x2=[0.02 0.02 0.06 0.06 0.11 0.11 0.22 0.22 0.56 0.56 1.10 1.10];
y2=[76 47 97 107 123 139 159 152 191 201 207 200];%已处理
xx1=[x1 x2];
xx2=[zeros(1,11) ones(1,12)];
x=[xx1' xx2'];
y=[y1 y2]';

beta0=[170 0.05 60 0.01];
[beta,R,J]=nlinfit(x,y,'huaxue2',beta0);
betaci=nlparci(beta,R,J);
beta,betaci
%plot(xx1,R,'+')

yyy=[y1 y2];
yy=(beta(1)+beta(3)*xx2).*xx1./((beta(2)+beta(4).*xx2)+xx1);
plot(xx1,yyy,'o',xx1,yy,'+')
axis([0 1.4 40 220])

nlintool(x,y,'huaxue2',beta)

clear
format short g;
load xinjindata.txt
[m,n]=size(xinjindata)

x1=xinjindata(:,3);
x2=xinjindata(:,4);
x3=xinjindata(:,5);
x4=xinjindata(:,6);
y=xinjindata(:,2);
x=[ones(m,1) x1 x2 x3 x4];

[b,bint,r,rint,stats]=regress(y,x);

b,bint,stats

subplot(1,2,1);
plot(x1,r,'+')
hold on

xx=xinjindata(:,7); %6ÖÖ×éºÏ
subplot(1,2,2);
plot(xx,r,'+')
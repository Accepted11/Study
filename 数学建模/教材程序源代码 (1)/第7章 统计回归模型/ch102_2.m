clear
format short g;
load xinjindata.txt
xinjindata(33,:)=[] %É¾³ý33ÐÐ
[m,n]=size(xinjindata);

x1=xinjindata(:,3);
x2=xinjindata(:,4);
x3=xinjindata(:,5);
x4=xinjindata(:,6);
x5=x2.*x3;
x6=x2.*x4;
y=xinjindata(:,2);
x=[ones(m,1) x1 x2 x3 x4 x5 x6];

[b,bint,r,rint,stats]=regress(y,x);

b,bint,stats

subplot(1,2,1);
plot(x1,r,'+')

xx=xinjindata(:,7);
subplot(1,2,2);
plot(xx,r,'+')
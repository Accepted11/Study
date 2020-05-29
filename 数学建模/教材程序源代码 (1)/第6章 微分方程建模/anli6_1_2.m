clc, clear
a=textread('data4.txt'); %把原始数据保存在纯文本文件data4.txt中
x=a([2:2:6],:)'; x=nonzeros(x);
t=[1790:10:2000]';
a=[ones(21,1), -x(2:end)]; 
b=diff(x)./x(2:end)/10;
cs=a\b;
r=cs(1), xm=r/cs(2)

% t0=t(1); x0=x(1);
% fun2=@(cs,td) cs(1)./(1+(cs(1)/x0-1)*exp(-cs(1)/cs(2)*(td-t0)));
% tt=1790:2010;
% yy2=fun2(cs,tt);
% plot(tt,yy2,'b')



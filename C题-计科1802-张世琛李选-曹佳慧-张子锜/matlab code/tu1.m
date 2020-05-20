clear;clc;
tuangou=xlsread('tuangou');
ping1=xlsread('ping1');
result=zeros(383,1);
tuan=zeros(383,1);
a=tuangou(1,1);
tuan(1,1)=a;
k=0;
for i=1:846
    if tuangou(i,1)==a
        k=k+1;
    end
end
for i=1:k
    result(1,1)=result(1,1)+ping1(i,1);
end
result(1,1)=result(1,1)./k;
for l=2:383
    a=tuangou(k+1,1);
    tuan(l,1)=a;
    j=k;
    for i=j+1:846
        if tuangou(i,1)==a
            k=k+1;
        end
    end
    for i=j+1:k
        result(l,1)=result(l,1)+ping1(i,1);
    end
    result(l,1)=result(l,1)./(k-j)
end

xx=tuan';
yx=result';
format short
hold off
xxi=1:0.3:383;
f1=interp1(xx,yx,xxi,'linear');
f2=interp1(xx,yx,xxi,'pchip');
f3=interp1(xx,yx,xxi,'spline');
f4=interp1(xx,yx,xxi,'nearext');
plot(xx,yx,'r--','linewidth',1)

hold on
plot(xxi,f1,'b--','linewidth',1)
plot(xxi,f2,'ro--','linewidth',1)
plot(xxi,f3,'k--','linewidth',1)
plot(xxi,f4,'b','linewidth',1)
legend('原始数据','线性插值','三次插值','样条插值','最近邻插值')
figure
x=tuan';
y=result';
a1=polyfit(x,y,1);
a2=polyfit(x,y,2);
a3=polyfit(x,y,3);
x1=[9.9:0.05:2598];
y1=a1(2)+a1(1)*x1;
y2=a2(3)+a2(2)*x1+a2(1).*x1.*x1;
y3=a3(1).*x1.*x1.*x1+a3(2).*x1.*x1+a3(3)*x1+a3(4);
plot(x,y,'*')
hold on
plot(x1,y1,'b--',x1,y2,'k',x1,y3,'r-','linewidth',2);
legend('原始数据','一次拟合','二次拟合','三次拟合')

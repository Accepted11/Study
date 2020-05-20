clc
clear all
maozhong=xlsread('mao');
ping=xlsread('ping2');
result=zeros(105,1);
mao=zeros(105,1);
a=maozhong(1,1)
mao(1,1)=a;
k=0;
for i=1:846
    if maozhong(i,1)==a
        k=k+1;
    end
end;
for i=1:k
    result(1,1)=result(1,1)+ping(i,1);
end
result(1,1)=result(1,1)./k;
for l=2:105
    a=maozhong(k+1,1);
    mao(l,1)=a;
    j=k;
    for i=j+1:846
        if maozhong(i,1)==a
            k=k+1;
        end
    end
    for i=j+1:k
        result(l,1)=result(l,1)+ping(i,1);
    end;
    result(l,1)=result(l,1)./(k-j);
end
xx=mao';
yx=result';
format short
hold off
xxi=1:0.3:105;
f1=interp1(xx,yx,xxi,'linear');
plot(xx,yx,'r--','linewidth',2)
hold on
plot(xxi,f1,'b-','linewidth',2)
grid on

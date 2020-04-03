clc
clear all
a=textread('hubeizaoqi.txt');
xd=[1:1:23,25,26];
plot(xd,a(:,1),'*-')
hold on

xlabel("天数")
ylabel("人数")
title("湖北省肺炎疫情人数预测图")
yd=a(:,1)';
x0=[0.7,0.3];
[x,resnorm]=lsqcurvefit(@fun1,x0,xd,yd)
a=x(1);
b=x(2);
x1=0:0.1:28;
plot(x1,a*(1+b).^x1,'r')
legend("确诊人数","湖北省肺炎人数预测")
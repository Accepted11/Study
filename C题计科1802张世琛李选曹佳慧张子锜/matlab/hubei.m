clc
clear all
a=textread('hubeizaoqi.txt');
x=[1:1:23,25,26];
length(a(:,1))
plot(x,a(:,1)','.-',x,a(:,2)','*-')
hold on
legend("确诊人数","死亡人数")
xlabel("天数")
ylabel("人数")
title("湖北省肺炎疫情人数统计")

clc
clear all
a=textread('hubeizaoqi.txt');
x=[1:1:23,25,26];
length(a(:,1))
plot(x,a(:,1)','.-',x,a(:,2)','*-')
hold on
legend("ȷ������","��������")
xlabel("����")
ylabel("����")
title("����ʡ������������ͳ��")

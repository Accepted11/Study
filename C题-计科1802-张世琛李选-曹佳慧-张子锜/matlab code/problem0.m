clc
clear all
data=textread('data.txt');
high=data(:,1);
high=high(:);
weight=data(:,2);
weight=weight(:);
shuju=[high weight];
jun_zhi=mean(shuju)
zhongweishu=median(shuju)
biaozhuncha=std(shuju)
jicha=range(shuju)

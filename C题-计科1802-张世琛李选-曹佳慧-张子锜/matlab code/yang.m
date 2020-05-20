clc
clear all
[data1,data]=xlsread('yang.xls');
data=char(data);
data=abs(data);
a=zeros(846,7);
c=846.*11./log10(1.5)./10000;
reault=zeros(846,1);
for i=1:846
    a(i,1)=29275;
    a(i,2)=22902;
end
k=0;
for i=1:846
    if data(i,1)==a(i,1)&&data(i,2)==a(i,2)
        k=k+1;
    end
end
for i=1:846
    if data(i,1)==a(i,1)&&data(i,2)==a(i,2)
        result(i,1)=k./c;
    end
end
for i=1:846
    a(i,1)=32650;
    a(i,2)=22902;
end
k=0;
for i=1:846
    if data(i,1)==a(i,1)&&data(i,2)==a(i,2)
        k=k+1;
    end
end
for i=1:846
    if data(i,1)==a(i,1)&&data(i,2)==a(i,2)
        result(i,1)=k./c;
    end
end
xlswrite('yang1.xlsx',result,1,'A1:A846')
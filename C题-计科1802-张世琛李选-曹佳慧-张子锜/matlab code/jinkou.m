clc
clear all
[data1,data]=xlsread('jinkou.xls');
data=char(data);
data=abs(data);
a=zeros(846,7);
c=846.*11./log10(1.5)./10000;
reault=zeros(846,1);
for i=1:846
    a(i,1)=36827;
    a(i,2)=21475;
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
    a(i,1)=22269;
    a(i,2)=20135;
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
xlswrite('jinkou1.xlsx',result,1,'A2:A847')
clc
clear all
[data1,data]=xlsread('peifang.xls');
data=char(data);
data=abs(data);
a=zeros(846,7);
c=846.*11./log10(1.5)./10000;
result=zeros(846,1);
for i=1:846
    a(i,1)=24120;
    a(i,2)=35268;
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
    a(i,1)=29305;
    a(i,2)=27530;
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
    a(i,1)=26377;
    a(i,2)=26426;
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
    a(i,1)=54;
    a(i,2)=23681;
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
    a(i,1)=24503;
    a(i,2)=22269;
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
    a(i,1)=27861;
    a(i,2)=22269;
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
    a(i,1)=20854;
    a(i,2)=23427;
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
xlswrite('peifang1.xlsx',result,1,'A1:A846')
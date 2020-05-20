clc;
clear;
A=xlsread('data','A2:K847')
a=size(A,1);
b=size(A,2);
MX=max(A);
MN=min(A);
f1=1;
f2=1;
for j=1:b
    for i=1:a
        A(i,j)=(A(i,j)-MN(j))/(MX(j)-MN(j));
    end
end
A1=[A(:,1) A(:,1)  A(:,1) A(:,1) A(:,1) A(:,1) A(:,1) A(:,1) A(:,1) A(:,1)]
ping=abs(A(:,2:11)-A1);
p=0.5;
MX=max(ping)
MX=max(MX)
MN=min(ping)
MN=min(MN)
ping=(MN.*ones(a,b-1)+p*MX.*ones(a,b-1))./(ping+p*MX.*ones(a,b-1));
ping1=sum(ping,1)./a;
result=ping1
x=1:10;
y=result
figure
bar(x',y','stacked');
ylabel('y');
colormap(cool);
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10]);
set(gca,'XTicklabel',{'商品名称','商品毛重','奶源产地','国产进口','适用年龄','包装单位','配方','分类','段位','团购价'});
h=gca;
th=fun(h,30);
clear
clc
figure
data=[168 207 396 73 2];
label={'0-0.5','0.5-1','1-3','3-6','6+'};
explode=[0 0 1 0 0 ];
bili=data/sum(data);
baifenbi=num2str(bili'*100,'%1.2f');
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
pie(data,explode,Label);
colormap jet;
pie3(data,explode);
colormap hsv 
ts=[0:150];
x0=[1,1000000];
[t,x]=ode45('ill1',ts,x0);
figure
plot(t,x(:,1),t,x(:,2));
xlabel("����")
ylabel("����")
title("�人ʡ������������Ԥ��ͼ")
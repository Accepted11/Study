ts=[0:150];
x0=[1,1000000];
[t,x]=ode45('ill',ts,x0);
figure
plot(t,x(:,1),t,x(:,2));
xlabel("����")
ylabel("����")
title("�人ʡ������������Ԥ��ͼ")
figure
plot(x(:,2),x(:,1));
hold on
plot([0,1000000],[1000000,0])
xlabel("S")
ylabel("I")
title("S-I��ͼ")
ts=[0:150];
x0=[1,1000000];
[t,x]=ode45('ill3',ts,x0);
[t1,x1]=ode45('ill4',ts,x0);
[t2,x2]=ode45('ill5',ts,x0);
plot(t,x(:,1),t1,x1(:,1),t2,x2(:,1));
xlabel("天数")
ylabel("人数")
title("武汉省肺炎疫情人数预测图")
t=0:0.1:150;
a=0.0000003*((stepfun(t,0)-stepfun(t,25))+stepfun(t,25)*exp(-0.05*(t-25)))
plot(t,a)
xlabel("����")
ylabel("��Ⱦ��")
title("�人ʡ���������Ⱦ��")
help
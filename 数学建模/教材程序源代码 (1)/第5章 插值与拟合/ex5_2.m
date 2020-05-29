clc, clear
x0=0.15:0.01:0.18;
y0=[3.5	1.5	2.5	2.8];
pp=csape(x0,y0)   %默认的边界条件，Lagrange边界条件
format long g
xishu=pp.coefs   %显示每个区间上三次多项式的系数
s=quadl(@(t)ppval(pp,t),0.15,0.18)  % ppval函数: 给出三次样条插值pp在x处对应的函数值。
                                    % quadl高阶法数值积分
format  %恢复短小数的显示格式

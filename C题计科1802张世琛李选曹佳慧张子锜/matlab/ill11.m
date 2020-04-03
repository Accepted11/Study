function y = ill8(t,x)
a=0.0000003*((stepfun(t,0)-stepfun(t,25))+stepfun(t,25).*exp(-0.05.*(t-25)));

b=0.0077266*(stepfun(t,0)+stepfun(t,25)*(5.5/(1+exp(-1*(t-28)))));


y=[a*x(1)*x(2)-b*x(1),-a*x(1)*x(2)]';
end
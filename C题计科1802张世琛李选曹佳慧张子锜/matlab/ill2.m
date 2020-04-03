function y = ill2(t,x)
a=0.0000025;
b=1/14;
y=[a*x(1)*x(2)-b*x(1),-a*x(1)*x(2)]';
end
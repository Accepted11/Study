function yhat = huaxue2( beta,x)
yhat=(beta(1)+beta(3)*x(:,2)).*x(:,1)./(beta(2)+beta(4)*x(:,2)+x(:,1));
end

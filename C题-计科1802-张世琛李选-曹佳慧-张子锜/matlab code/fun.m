function th=fun(h,rot)
if nargin==3 
    x=[now-.7 now-.3 now];
    y=[20 35 15];
    figure
    plot(x,y,'-');
    datetick (x', 0, keepticks')
    h=gca;
    set(h,'position',[0.13 0.35 0.775 0.55]);
    rot=90;
end
if nargin==1  
    rot=90;
end
a=get(h,'XTickLabel');
set(h,'XTickLabel',[]);
b=get(h,'XTick');
c=get(h, 'YTick');
if rot<180 
    th=text(b, repmat (c(1)-.1*(c(2)-c(1)), length(b), 1), a, 'HorizontalAlignment','right','fontsize',10,'fontweight','bold', 'rotation',rot);
else
    th=text(b, repmat (c(1)-.1*(c(2)-c(1)), length(b), 1), a, 'HorizontalAlignment','left','fontsize',10,'fontweight','bold', 'rotation',rot);
end
end


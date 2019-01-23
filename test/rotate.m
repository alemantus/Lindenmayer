function h=rotate(x1,y1,theta,len,angle)

x2=x1+cos(theta)*len;
y2=y1+sin(theta)*len;
if len~=0
    h=line([x1 x2], [y1 y2], 'LineWidth', 2);
    xlim([-30 30]);
    ylim([-10 40]);
    rotate(x2, y2,theta+angle, len-1,angle);
    rotate(x2, y2,theta-angle, len-1,angle);
end

 

function h=rotate(x1,y1,theta,len)

x2=x1+cos(theta)*len;
y2=y1+sin(theta)*len;

if len~=0
    line([x1 x2], [y1 y2], 'LineWidth', 2);
    rotate(x2, y2,theta+pi/3, len-1);
    rotate(x2, y2,theta-pi/3, len-1);
end

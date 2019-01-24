function fracTree()

axis(gca,'equal');

while 1
    v=[1 0];
    
%     [x,y] = ginput(1);
%     E=[x,y];
% 
%     if sum(E)~=0
%         clf
%     end

    
%     CosTheta = dot(E,v)/(norm(E)*norm(v));

    %mouseAng = asin(CosTheta);
    mouseAng = pi/3;

    rotate(0,0,pi/2,8,mouseAng);

end



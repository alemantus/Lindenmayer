function turtlePlot2(turtleCommands)


d=[[0;1] zeros(2,length(turtleCommands/2))];
x=[[0;0] zeros(2,length(turtleCommands/2))];

stackD=[];
stackX=[];

for i = 1:length(turtleCommands)
    if turtleCommands(i)==1/4*pi
        
        stackD=[stackD; d(:,i)]; %Push D values to stack
        stackX=[stackX; x(:,i)]; %Push X values to stack
        d(:,i+1)=[cos(1/4*pi), -sin(1/4*pi); sin(1/4*pi), cos(1/4*pi)]*d(:,i);
        
    elseif turtleCommands(i)==-1/4*pi
        
        d(:,i)=stackD(:,end);
        x(:,i)=stackX(:,end);
        d(:,i+1)=[cos(-1/4*pi), -sin(-1/4*pi); sin(-1/4*pi), cos(-1/4*pi)]*d(:,i);
        stackD(:,end)=[]; %Pop D values from stack
        stackX(:,end)=[]; %Pop X values from stack
        

    else
        d(:,i+1)=d(:,i);        
    end
        
    if turtleCommands(i)==1/2
        
        x(:,i+1)=x(:,i)+1/2*d(:,i+1);
    elseif turtleCommands(i)==1/4
%         disp(d(:,i));
%         disp(x(:,i));
        x(:,i+1)=x(:,i)+1/4*d(:,i+1);
    end
    if all(x(:,i+1))==0
        x(:,i+1)=x(:,i);
    end
    disp(x);

end
%     disp(d);
%     disp(x);
plot(x(1,:),x(2,:));

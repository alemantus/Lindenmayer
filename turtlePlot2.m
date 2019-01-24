function plotData=turtlePlot2(turtleCommands)

stackD=[];
stackX=[];
d=[[1;0] zeros(2,length(turtleCommands/2))];
x=[[0;0] zeros(2,length(turtleCommands/2))];

for i = 1:length(turtleCommands)
    if turtleCommands(2,i) == 2 %Checks if current command is an angle
        d(:,i+1)=[cos(turtleCommands(1, i)), -sin(turtleCommands(1, i)); sin(turtleCommands(1, i)), cos(turtleCommands(1, i))]*d(:,i);
        x(:,i+1)=x(:,i); %Next position will be the same
    elseif turtleCommands(2,i) == 1 %Checks if current command is a length
        x(:,i+1)=x(:,i)+turtleCommands(1, i)*d(:,i);
        d(:,i+1)=d(:,i); %Next direction will be the same
        line(x(1,i), x(2,i));
    elseif turtleCommands(2,i) == 3
        stackD=[stackD d(:,i)]; %Push D values to stack
        stackX=[stackX x(:,i)]; %Push X values to stack
        d(:,i+1)=[cos(1/4*pi), -sin(1/4*pi); sin(1/4*pi), cos(1/4*pi)]*d(:,i);
        x(:,i+1)=x(:,i); %Next position will be the same
    elseif turtleCommands(2,i) == 4
        d(:,i)=stackD(:,end);
        x(:,i+1)=stackX(:,end);
        stackD=stackD(:,1:end-1); %Pop D values from stack
        stackX=stackX(:,1:end-1); %Pop X values from stack
        d(:,i+1)=[cos(-1/4*pi), -sin(-1/4*pi); sin(-1/4*pi), cos(-1/4*pi)]*d(:,i);
    end
    

end
plotData = x;
%line(x(1,:), x(2,:));
plot(x(1,:), x(2,:));
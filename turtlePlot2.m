function turtlePlot2(turtleCommands)


d=[[0;1] zeros(2,length(turtleCommands/2))];
x=[[0;0] zeros(2,length(turtleCommands/2))];
angle = 0;
stackAng=0;
stackPos=[0;0];


stackDex = 1;

for i = 1:length(turtleCommands)
    if turtleCommands(i)==1/4*pi       
        %disp(angle);
        stackAng=[stackAng;angle]; %Push angle values to stack        
        stackPos=[stackPos, d(:,i)]; %Push pos values to stack
        angle=angle+pi/4;   
        d(:,i+1)=[cos(angle), -sin(angle); sin(angle), cos(angle)]*d(:,i);
        

    elseif turtleCommands(i)==(-1/4*pi)

        d(:,i)=stackPos(:,end);
        
        angle=stackAng(end);
        
        
        stackDex = stackDex-1;
        
        angle=angle-pi/4;
        d(:,i+1)=[cos(angle), -sin(angle); sin(angle), cos(angle)]*d(:,i);
        stackAng(end)=[]; %Pop X values from stack
        stackPos(:,end)=[]; %Pop D values from stack
        
        disp(i);
        disp(angle);
        
        
    else
        d(:,i+1)=d(:,i);        
    end
      %disp(angle);  
    if turtleCommands(i)==1/2
        x(:,i+1)=x(:,i)+1/2*d(:,i+1);    
        %disp("test1");
    elseif turtleCommands(i)==1/4
        %disp("test2");
        x(:,i+1)=x(:,i)+1/4*d(:,i+1);
    end


end
%        disp(d);
%        disp(x);
plot(x(1,:),x(2,:));

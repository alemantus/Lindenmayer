function turtlePlot2(turtleCommands)

d=[[1;0] zeros(2,length(turtleCommands/2))];
x=[[0;0] zeros(2,length(turtleCommands/2))];
angle = 0;
stackAng=0;
stackPos=[0;0];


stackDex = 1;

%since every len entry is the same
lineLen = turtleCommands(1);
%extracts every even index entry from turtleCommands
lineAng = turtleCommands(2:2:end);
%The first values needs to be initialized manually
d=[[1;0] zeros(2,length(lineAng)-1)];
x=[[0;0], zeros(2,length(lineAng)-1)];

for i = 1:length(turtleCommands)
<<<<<<< HEAD
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
=======
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

%line(x(1,:), x(2,:));
>>>>>>> Gustav

function turtlePlot(turtleCommands)


    %since every len entry is the same
    lineLen = turtleCommands(1);
    %extracts every even index entry from turtleCommands
    lineAng = turtleCommands(2:2:end);


    %The first values needs to be initialized manually
    d=[[1;0] zeros(2,length(lineAng)-1)];
    x=[[0;0], [lineLen;0], zeros(2,length(lineAng)-2)];


    for i = 1:length(turtleCommands)/2
        d(:,i+1)=[cos(lineAng(i)), -sin(lineAng(i)); sin(lineAng(i)), cos(lineAng(i))]*d(:,i);

        x(:,i+2)=x(:,i+1)+lineLen*d(:,i+1);    
    end

        plot(x(1,:), x(2,:));
    
%     case 2
%         %lineLen = turtleCommands(1);
%         %lineAng = turtleCommands(turtleCommands==1/4*pi | turtleCommands==-1/4*pi);
% 
%         stackD=[];
%         stackX=[];
%         
%         d=[[0;1] zeros(2,length(turtleCommands/2))];
%         x=[[0;0], zeros(2,length(turtleCommands/2))];
%         %disp(turtleCommands);
%         
%         for i = 1:length(turtleCommands)
%             %d(:,i+1)=[cos(lineAng(i)), -sin(lineAng(i)); sin(lineAng(i)), cos(lineAng(i))]*d(:,i);
%             x(:,i+1)=x(:,i)+turtleCommands(i)*d(:,i);
%             if turtleCommands(i)==1/4*pi
%                 stackD=[stackD; d(:,i)]; %Push D values to stack
%                 stackX=[stackX; x(:,i)]; %Push X values to stack
%                 d(:,i+1)=[cos(1/4*pi), -sin(1/4*pi); sin(1/4*pi), cos(1/4*pi)]*d(:,i);
% 
%             elseif turtleCommands(i) ==-1/4*pi
%                 d(:,i)=stackD(:,end);
%                 x(:,i)=stackX(:,end);
%                 stackD=stackD(:,1:end-1); %Pop D values from stack
%                 stackX=stackX(:,1:end-1); %Pop X values from stack
%                 d(:,i+1)=[cos(-1/4*pi), -sin(-1/4*pi); sin(-1/4*pi), cos(-1/4*pi)]*d(:,i);
%                 
%             else
%                 d(:,i+1)=d(:,i);
%                 x(:,i+2)=x(:,i+1)+turtleCommands(i)*d(:,i+1);
%             end
%             
%         end
%         
%         disp(x);    
%         plot(x(1,:),x(2,:));
% end


turtlePlot=x;
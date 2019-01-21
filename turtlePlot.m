function turtlePlot(turtleCommands)

lineLen = turtleCommands(1);
lineAng = turtleCommands(2:2:end).';

%disp(lineAng);
d=[[1;0] zeros(2,length(lineAng))];
x=[[0, 1;0, 0] zeros(2,length(lineAng))];

for i = 2:length(turtleCommands)/2
    
    lineAng(i) = turtleCommands(i+1); %Angle
    
    d(:,i+1)=[cos(lineAng(i)), sin(lineAng(i)); -sin(lineAng(i)), cos(lineAng(i))]*d(:,i);
    
    %d(:,i+1)=[cos(lineAng(i)), sin(lineAng(i)); -sin(lineAng(i)), cos(lineAng(i))];
    
    x(:,i+1)=x(:,i)+lineLen*d(:,i+1);
end
plot(x(1,:), x(2,:));
disp(x);
%disp(x);
turtlePlot=0;
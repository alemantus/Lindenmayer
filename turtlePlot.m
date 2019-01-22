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

turtlePlot=x;
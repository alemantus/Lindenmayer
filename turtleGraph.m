function [turtleCommands] = turtleGraph(LindenmayerString)

coord = double(cell2mat(split(LindenmayerString,""))).';


%Koch
if any(coord=='S')
    
    %Number of iterations specified in LindIter.m
    iteration=log((numel(coord)/2)+1/2)/(2*log(2));
    
    %length determination    
    coord(coord=='S')=(1/3)^iteration;

    %the angle depends on the first letter
    
    coord(coord=='R') =-2/3*pi;
    coord(coord=='L') =1/3*pi;

%Sierpinski
elseif any(coord=='A')
    
    %Number of iterations specified in LindIter.m
    iteration = log(numel(coord)/2+1/2)/log(3);
    
    %length determination
    coord(coord=='A'|coord=='B')=(1/2)^iteration;
    
    %the angle depends on the first letter
    coord(coord=='R') =-1/3*pi;
    coord(coord=='L') =1/3*pi;
    
    type = 1;
    
elseif any(coord=='[')
    
    %iteration = log(numel(coord)/2+1/2)/log(3);
    
    coord(coord=='1')=(1/2);
    coord(coord=='0')=(1/4);
    
    coord(coord==']') =-0.7854;
    coord(coord=='[') =0.7854;  
    type = 2;
    disp(coord);
end

turtleCommands = coord;



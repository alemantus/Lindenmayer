function [turtleCommands] = turtleGraph(LindenmayerString)

%disp(LindenmayerString);
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
    
elseif any(coord=='F')
    
    %Number of iterations specified in LindIter.m
    iteration = log(numel(coord)/2+1/2)/log(3);
    
    %length determination
    coord(coord=='F')=(1/2)^iteration;
    %coord(coord=='F')=[];
    
    %the angle depends on the first letter
    coord(coord=='R') =-(1/2)*pi;
    coord(coord=='L') =(1/2)*pi;
    
    %disp(coord);
    
    
elseif any(coord=='[')
    
    %iteration = log(numel(coord)/2+1/2)/log(3);
    
    coord(coord=='1')=(1/2);
    coord(coord=='0')=(1/4);
    
    coord(coord==']') =-1/4*pi;
    coord(coord=='[') =1/4*pi;  
    type = 2;
<<<<<<< HEAD
%     disp(coord);
=======
    %disp(coord);
>>>>>>> Gustav
end

turtleCommands = coord;



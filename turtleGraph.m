function turtleCommands = turtleGraph(LindenmayerString)

coord = double(cell2mat(split(LindenmayerString,""))).';


%Koch
if any(coord(:)=='S')
    
    %Number of iterations specified in LindIter.m
    iteration=log((numel(coord)/2)+1/2)/(2*log(2));
    
    %length determination    
    coord(coord=='S')=(1/3)^iteration;

    %the angle depends on the first letter
    coord(2)=1/3*pi;
    
    i=4;
    while i<length(coord)
        if coord(i)=='R'
            coord(i)=-2/3*pi;
        elseif coord(i)=='L'
            coord(i)=1/3*pi;
        end
        %since only every second letter is an angle letter
        i=i+2;
    end

%Sierpinski
elseif any(coord(:)=='A')
    
    %Number of iterations specified in LindIter.m
    iteration = log(numel(coord)/2+1/2)/log(3);
    
    %length determination
    coord(coord=='A'|coord=='B')=(1/2)^iteration;
    
    %the angle depends on the first letter
    if coord(2)=='L'
        coord(2)=1/3*pi;
    elseif coord(2)=='R'
        coord(2)=(-1/3*pi);
    end
    
    i=4;
    while i<length(coord)
        if coord(i)=='R'
            coord(i)=-1/3*pi;
        elseif coord(i)=='L'
            coord(i)=1/3*pi;
        end
        %since only every second letter is an angle letter
        i=i+2;
    end
    
    
end

turtleCommands = coord;

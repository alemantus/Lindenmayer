function turtleCommands = turtleGraph(LindenmayerString)

coord = double(cell2mat(split(LindenmayerString,""))).';



if any(coord(:)=='S')
    iteration=log((numel(coord)/2)+1/2)/(2*log(2));
    
    coord(coord=='S')=(1/3)^iteration;

    
    coord(2)=1/3*pi;
    i=4;
    while i<length(coord)
        if coord(i)=='R'
            coord(i)=coord(i-2)-2/3*pi;
        elseif coord(i)=='L'
            coord(i)=coord(i-2)+1/3*pi;
        end
        i=i+2;
    end


elseif any(coord(:)=='A')
    
    iteration = log(numel(coord)/2+1/2)/log(3);
    
    
    coord(coord=='A'|coord=='B')=(1/2)^iteration;
    
    if coord(2)=='L'
        coord(2)=1/3*pi;
    elseif coord(2)=='R'
        coord(2)=(-1/3*pi);
    end
        
    i=4;
    while i<length(coord)
        if coord(i)=='R'
            coord(i)=coord(i-2)-1/3*pi;
        elseif coord(i)=='L'
            coord(i)=coord(i-2)+1/3*pi;
        end
        i=i+2;
    end
    
    
end

turtleCommands = coord;
%disp(coords);


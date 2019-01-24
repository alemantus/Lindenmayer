function turtleCommands = turtleGraph(LindenmayerString)

coord = [double(cell2mat(split(LindenmayerString,""))).'; zeros(1, length(LindenmayerString))];
%Koch
if any(coord(1,:)=='S')
    for i=1:length(LindenmayerString)
        %Number of iterations specified in LindIter.m
        iteration=log((numel(coord)/2)+1/2)/(2*log(2));
        if coord(1,i)=='S'
            coord(:,i)=[(1/3)^iteration, 1];
        elseif coord(1,i)=='R'%the angle depends on the first letter
            coord(:,i)=[-2/3*pi, 2];

        elseif coord(1,i)=='L'
            coord(:,i)=[1/3*pi, 2];
        end

    end
%Sierpinski
elseif any(coord(1,:)=='A')
    for i=1:length(LindenmayerString)
        %Number of iterations specified in LindIter.m
        iteration=log((numel(coord)/2)+1/2)/(2*log(2));

        if coord(1,i)=='A' || coord(1,i)=='B'
            coord(:,i)=[(1/3)^iteration, 1];
        elseif coord(1,i)=='R'%the angle depends on the first letter
            coord(:,i)=[-1/3*pi, 2];

        elseif coord(1,i)=='L'
            coord(:,i)=[1/3*pi, 2];
        end

    end
elseif any(coord(1,:)=='[')
    for i=1:length(LindenmayerString)
        if coord(1,i)=='1'
            coord(:,i)=[1/2, 1];
        elseif coord(1,i)=='0'
            coord(:,i)=[1/4, 1];
        elseif coord(1,i)=='['%Push
            coord(:,i)=[-1/4*pi, 3];
        elseif coord(1,i)==']'%Pop
            coord(:,i)=[1/4*pi, 4];
        end

    end

elseif any(coord(1,:)=='F')
    for i=1:length(LindenmayerString)
        %We found out that it's way easier to just do an exponential
        %regression and then round to nearest integer, if you want to find
        %the number of iterations:s
        iteration=round(1.388461209*log(0.3968302592*length(coord)));
        if coord(1,i)=='F'
            coord(:,i)=[1/2^iteration, 1];
        elseif coord(1,i)=='R'%the angle depends on the first letter
            coord(:,i)=[-1/2*pi, 2];
        elseif coord(1,i)=='L'
            coord(:,i)=[1/2*pi, 2];
        end
    end
end
turtleCommands = coord;

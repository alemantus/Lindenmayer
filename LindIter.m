function LindenmayerString = LindIter(System, N)

if strcmp(System, "Koch")
    ourStr = 'S';
    for i = 1:N
        ourStr = strrep(ourStr, 'S', 'SLSRSLS');
    end    
    
elseif strcmp(System, "Sierpinski")
    
    ourStr = 'A';
    
    for k = 1:N
        old = {'A','B'};
        new = {'BRARB','ALBLA'};
        ourStr = replace(ourStr,old,new);  
    end

end


LindenmayerString = ourStr;
%LindenmayerString(LindenmayerString=="R" | LindenmayerString=="L") = [];
%LindenmayerString(LindenmayerString=="S") = [];
% 



%disp(numel(LindenmayerString));
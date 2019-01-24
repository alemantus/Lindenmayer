function LindenmayerString = LindIter(System, N)


if strcmp(System, "Koch")
    ourStr = 'S';
    for i = 1:N
        ourStr = strrep(ourStr, 'S', 'SLSRSLS');
    end

elseif strcmp(System, "Sierpinski")

    ourStr = 'A';

    for i = 1:N
        %different method ensures no redundant letter replacement
        old = {'A','B'};
        new = {'BRARB','ALBLA'};
        ourStr = replace(ourStr,old,new);
    end
elseif strcmp(System, "Dragon curve")
    ourStr = 'FX';

    for i = 1:N
        old = {'X','Y'};
        new = {'XRYFR','LFXLY'};
        ourStr = replace(ourStr,old,new);
    end
    %The dragon doesn't require X and Y, so we'll exclude those.
    ourStr=ourStr(ourStr=='F' | ourStr=='R' | ourStr=='L');

    elseif strcmp(System, "Fractal tree")
    ourStr = '0';
    for i = 1:N
        old = {'1','0'};
        new = {'11','1[0]0'};
        ourStr = replace(ourStr,old,new);
    end

end
LindenmayerString = ourStr;

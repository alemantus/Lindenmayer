 
menuOptions = ["Select type", "Generate diagrams","Tell me a joke!", "Terminate program"];
sysOptions = ["Koch","Sierpinski"];

linStr = "";
while 1
    switch displayMenu(menuOptions)
        case 1
            linSystem = input("Please choose the desired type of system\n    -Koch\n    -Sierpinski\n: ",'s');
            if any(sysOptions == linSystem)
                linN = inputNumber("Please specify the desired iterations (note that it is not recommended to do more than 10:\n");
                LinStr = LindIter(linSystem,linN);  
            else
                fprintf("No such system available\n");
            end
            
        case 2
            if ~strcmp(LinStr,"")
                turtlePlot(turtleGraph(LinStr));
            else 
                fprintf("You need to specify system and number of iterations before you generate diagrams\n");
            end
        case 4
            break;
    end
    fprintf("\n");
end
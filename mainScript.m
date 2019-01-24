menuOptions = ["Select type", "Generate diagrams","Launch GUI", "Terminate program"];
sysOptions = ["Koch","Sierpinski","Dragon curve","Fractal tree"];

LinStr = "";
while 1
    switch displayMenu(menuOptions)
        case 1
            fprintf("Please choose the desired type of system\n");
            switch displayMenu(sysOptions)
                case 1
                    linN = inputNumber("Please specify the desired iterations (note that it is not recommended to do more than 5:\n");
                    LinStr = "Koch"; 
                case 2
                    linN = inputNumber("Please specify the desired iterations (note that it is not recommended to do more than 10:\n");
                    LinStr = "Sierpinski";
                case 3
                    linN = inputNumber("Please specify the desired iterations (note that it is not recommended to do more than 15:\n");
                    LinStr = "Dragon curve";
                case 4
                    linN = inputNumber("Please specify the desired iterations (note that it is not recommended to do more than 8:\n");
                    LinStr = "Fractal tree";
            end          
        case 2
            if ~strcmp(LinStr,"")
                turtlePlot(turtleGraph(LindIter(LinStr,linN)));            
                spellError = 0;
                while 1
                    savePlots = input("Do you wish to save plots? (yes/no): ",'s');
                    if strcmp(savePlots,"yes")
                        saveStr=strcat("Figures\\",LinStr,".png");
                        saveas(gcf,saveStr);
                        fprintf("Saved at: %s", saveStr);
                        break;
                    elseif strcmp(savePlots,"no")
                        fprintf("Ok, but remember that you can always save in the diagram menu.");
                        break;
                    elseif spellError > 3
                        fprintf("I think it would be best if we stop here... Your plots has not been saved.");
                        break;
                    else
                        fprintf("Please enter yes or no");
                        spellError = spellError+1;
                    end
                    fprintf("\n");
                end
            else 
                fprintf("You need to specify system and number of iterations before you generate diagrams\n");      
            end
        case 3
            gui;
        case 4
            break;
    end
    fprintf("\n");
end
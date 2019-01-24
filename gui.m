%https://se.mathworks.com/help/matlab/creating_guis/about-the-simple-guide-gui-example.html

%known bugs
%-Save function saves the whole gui
%-disabling and enabling safety outside safety zones does not change slider
%position eventhough the figure is generated with safety parameters.


function varargout = gui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
%Initialize data in order to display plot upon start
handles.iterations=5;
handles.safety=1;
set(handles.edit2,'String',handles.iterations);
handles.current_data = "Sierpinski";
turtlePlot(turtleGraph(LindIter(handles.current_data,handles.iterations)));

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%clear display
cla;

%generates plot
turtlePlot(turtleGraph(LindIter(string(handles.current_data),handles.iterations)));



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

handles.popStr = get(hObject, 'String');
handles.popVal = get(hObject,'Value');
% Set current data to the selected data set.
switch handles.popStr{handles.popVal}
    case 'Sierpinski' % User selects peaks.
       handles.current_data = "Sierpinski";
    case 'Koch' % User selects membrane.
       handles.current_data = "Koch";
    case 'Fractal tree' % User selects sinc.
       handles.current_data = "Fractal tree";
    case 'Dragon curve'
        handles.current_data = "Dragon curve";
end
% Save the handles structure.
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
%Safety feature
Value = round(get(hObject, 'Value'));
if handles.safety == 1
    switch handles.current_data
        case 'Sierpinski'
            if Value > 10
                set(hObject, 'Value', 10);
                handles.iterations=get(hObject,'Value');
            else
                set(hObject, 'Value', Value);
                handles.iterations=get(hObject,'Value');
            end
        case 'Koch'
            if Value > 6
                set(hObject, 'Value', 5);
                handles.iterations=get(hObject,'Value');
            else
                set(hObject, 'Value', Value);
                handles.iterations=get(hObject,'Value');
            end            
        case 'Fractal tree'
            if Value > 9
                set(hObject, 'Value', 8);
                handles.iterations=get(hObject,'Value');
            else
                set(hObject, 'Value', Value);
                handles.iterations=get(hObject,'Value');
            end
        case 'Dragon curve'
            if Value > 15
                set(hObject, 'Value', 15);
                handles.iterations=get(hObject,'Value');
            else
                set(hObject, 'Value', Value);
                handles.iterations=get(hObject,'Value');
            end
    end
else
    set(hObject, 'Value', Value);
    handles.iterations=get(hObject,'Value');
end

set(handles.edit2,'String',handles.iterations);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
handles.safety=get(hObject,'Value');
guidata(hObject,handles);

function edit3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
saveStr=strcat("Figures\\",handles.current_data,".png");

%This saves the whole gui as a screenshot since the gui itself is a figure.
%To save the plot alone one should do it using the mainScript.m 
%As a solution we tried to extract as a subplot and copy it to an invisible
%figure which we would the save..
saveas(gcf,saveStr);

dispStr = strcat("Saved at: ",saveStr);
set(handles.edit5,'String',dispStr);


function edit5_Callback(hObject, eventdata, handles)

function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

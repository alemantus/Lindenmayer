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
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)
% Create the data to plot.

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
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla
switch handles.current_data
    case 'Sierpinski'        
        turtlePlot(turtleGraph(LindIter(string(handles.current_data),handles.iterations)));
    case 'Koch'
        if handles.safety == 1 && handles.iterations > 5
            handles.iterations = 5;
        end
        turtlePlot(turtleGraph(LindIter(string(handles.current_data),handles.iterations)));
    case 'Fractal tree'
        if handles.safety == 1 && handles.iterations > 8
            handles.iterations = 8;
        end
        turtlePlot(turtleGraph(LindIter(string(handles.current_data),handles.iterations)));
    case 'Dragon curve'
        if handles.safety == 1 && handles.iterations > 15
            handles.iterations = 15;
        end
        turtlePlot(turtleGraph(LindIter(string(handles.current_data),handles.iterations)));
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Determine the selected data set.
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

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider



%Ensure that slider value is an integer
Value = round(get(hObject, 'Value'));
if handles.safety == 1
    switch handles.current_data
        case 'Sierpinski'
            set(hObject, 'Value', Value);
            handles.iterations=get(hObject,'Value');
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
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
handles.safety=get(hObject,'Value');
guidata(hObject,handles);

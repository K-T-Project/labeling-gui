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
end

function gui_OpeningFcn(hObject, eventdata, handles, varargin)

    handles.output = hObject;

    guidata(hObject, handles);
end


    % --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 

    varargout{1} = handles.output;
end

    % --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
end

    % --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
end


    % --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
end

    % --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
end



function edit1_Callback(hObject, eventdata, handles)
end


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


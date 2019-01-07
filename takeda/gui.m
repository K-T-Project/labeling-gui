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
    handles.ReadingFlag = false;
    handles.output = hObject;
    guidata(hObject, handles);
end


    % --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 

    varargout{1} = handles.output;

end

function figure1_DeleteFcn(hObject, eventdata, handles)
    if handles.ReadingFlag
        %write_csv( handles.datastruct.data);
        for i = 1:handles.datastruct.datanumber
            if handles.datastruct.EvalGet(i) == "Å~"
                delete(handles.datastruct.FullNameGet(i));
            end
        end
    end
end

    % éüÇ÷É{É^Éì
function pushbutton9_Callback(hObject, eventdata, handles)
    if handles.ReadingFlag
        if handles.datastruct.currentnumber ~= handles.datastruct.datanumber 
            handles.datastruct.currentnumber = handles.datastruct.currentnumber + 1;
            DisplaySetting(handles);
            guidata(hObject, handles);
        end
    end
end

    % ëOÇ÷É{É^Éì
function pushbutton10_Callback(hObject, eventdata, handles)
    if handles.ReadingFlag
        if handles.datastruct.currentnumber ~= 1
            handles.datastruct.currentnumber = handles.datastruct.currentnumber - 1;
            DisplaySetting(handles);
            guidata(hObject, handles);
        end
    end
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

function FileSelect(hObject, eventdata, handles)
    selpath = uigetdir;
    if selpath ~= 0
        datadirectory = dir([selpath,'/**/*.png']);
        
        DataDirectory = DataManage(datadirectory);

        if ~isempty(DataDirectory)
            handles.datastruct = DataDirectory;
            handles.ReadingFlag = true;
            DisplaySetting(handles)
            guidata(hObject, handles);
        end

    end
end

function DisplaySetting(handles)
    img = handles.datastruct.CurrentImageGet();
    imshow(img,'Parent',handles.axes1);
    handles.text2.String = handles.datastruct.CurrentNameGet();
    handles.edit2.String = handles.datastruct.currentnumber;
    handles.text4.String = handles.datastruct.datanumber;
    if handles.datastruct.CurrentEvalGet() == ""
        handles.togglebutton2.Value = 0;
        handles.togglebutton3.Value = 0;
        handles.togglebutton4.Value = 0;
        handles.togglebutton5.Value = 0;
        handles.togglebutton6.Value = 0; 
    elseif handles.datastruct.CurrentEvalGet() == "Åù"
        handles.togglebutton2.Value = 1;
        handles.togglebutton3.Value = 0;
        handles.togglebutton4.Value = 0;
        handles.togglebutton5.Value = 0; 
        handles.togglebutton6.Value = 0; 
    elseif handles.datastruct.CurrentEvalGet() == "ÅZ"
        handles.togglebutton2.Value = 0;
        handles.togglebutton3.Value = 1;
        handles.togglebutton4.Value = 0;
        handles.togglebutton5.Value = 0;
        handles.togglebutton6.Value = 0; 
    elseif handles.datastruct.CurrentEvalGet() == "Å¢"
        handles.togglebutton2.Value = 0;
        handles.togglebutton3.Value = 0;
        handles.togglebutton4.Value = 1;
        handles.togglebutton5.Value = 0;
        handles.togglebutton6.Value = 0;
    elseif handles.datastruct.CurrentEvalGet() == "Å~"
        handles.togglebutton2.Value = 0;
        handles.togglebutton3.Value = 0;
        handles.togglebutton4.Value = 0;
        handles.togglebutton5.Value = 1;
        handles.togglebutton6.Value = 0;
    elseif handles.datastruct.CurrentEvalGet() == "ÅH"
        handles.togglebutton2.Value = 0;
        handles.togglebutton3.Value = 0;
        handles.togglebutton4.Value = 0;
        handles.togglebutton5.Value = 0;
        handles.togglebutton6.Value = 1;
    end
end

function nijuumaru_Callback(hObject,eventdata,handles)
    if handles.ReadingFlag
        if handles.togglebutton2.Value == 1
            handles.datastruct.CurrentEvalSet("Åù");
            handles.togglebutton3.Value = 0;
            handles.togglebutton4.Value = 0;
            handles.togglebutton5.Value = 0; 
            handles.togglebutton6.Value = 0;
            guidata(hObject, handles);
        else
            handles.datastruct.CurrentEvalSet("");            
        end
    else
        handles.togglebutton2.Value = 0;
    end
end

function maru_Callback(hObject,eventdata,handles)
    if handles.ReadingFlag
        if handles.togglebutton3.Value == 1
            handles.datastruct.CurrentEvalSet("ÅZ");
            handles.togglebutton2.Value = 0;
            handles.togglebutton4.Value = 0;
            handles.togglebutton5.Value = 0; 
            handles.togglebutton6.Value = 0;
            guidata(hObject, handles);
        else
            handles.datastruct.CurrentEvalSet("");            
        end
    else
        handles.togglebutton3.Value = 0;
    end
end
function sankaku_Callback(hObject,eventdata,handles)
    if handles.ReadingFlag
        if handles.togglebutton4.Value == 1
            handles.datastruct.CurrentEvalSet("Å¢");
            handles.togglebutton2.Value = 0;
            handles.togglebutton3.Value = 0;
            handles.togglebutton5.Value = 0; 
            handles.togglebutton6.Value = 0;
            guidata(hObject, handles);
        else
            handles.datastruct.CurrentEvalSet("");            
        end
    else
        handles.togglebutton4.Value = 0;
    end
end
function hatena_Callback(hObject,eventdata,handles)
    if handles.ReadingFlag
        if handles.togglebutton6.Value == 1
            handles.datastruct.CurrentEvalSet("ÅH");
            handles.togglebutton2.Value = 0;
            handles.togglebutton3.Value = 0;
            handles.togglebutton4.Value = 0; 
            handles.togglebutton5.Value = 0;
            guidata(hObject, handles);
        else
            handles.datastruct.CurrentEvalSet("");            
        end
    else
        handles.togglebutton6.Value = 0;
    end
        
end

function batsu_Callback(hObject,eventdata,handles)
    if handles.ReadingFlag
        if handles.togglebutton5.Value == 1
            handles.datastruct.CurrentEvalSet("Å~");
            handles.togglebutton2.Value = 0;
            handles.togglebutton3.Value = 0;
            handles.togglebutton4.Value = 0; 
            handles.togglebutton6.Value = 0;
            guidata(hObject, handles);
        else
            handles.datastruct.CurrentEvalSet("");            
        end
    else
        handles.togglebutton5.Value = 0;
    end
end

function figure1_KeyPressFcn(hObject,eventdata,handles)
    if handles.ReadingFlag
        if length(eventdata.Modifier) == 1
            if strcmp(eventdata.Modifier, 'control')
                if eventdata.Key == 'z'
                    if handles.togglebutton5.Value == 1
                        handles.datastruct.CurrentEvalSet("");
                        handles.togglebutton2.Value = 0;
                        handles.togglebutton3.Value = 0;
                        handles.togglebutton4.Value = 0;
                        handles.togglebutton5.Value = 0; 
                        handles.togglebutton6.Value = 0;
                    else
                        handles.datastruct.CurrentEvalSet("Å~");
                        handles.togglebutton2.Value = 0;
                        handles.togglebutton3.Value = 0;
                        handles.togglebutton4.Value = 0;
                        handles.togglebutton5.Value = 1; 
                        handles.togglebutton6.Value = 0;
                    end
                    guidata(hObject, handles);
                elseif  eventdata.Key == 'y'
                    sankaku_Callback(hObject,eventdata,handles);
                end
            end
        end
        
        if strcmp(eventdata.Key,'leftarrow')
            pushbutton10_Callback(hObject, eventdata, handles);
        elseif strcmp(eventdata.Key,'rightarrow')
            pushbutton9_Callback(hObject, eventdata, handles)
        end
        
    end

end
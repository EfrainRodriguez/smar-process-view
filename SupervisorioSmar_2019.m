function varargout = SupervisorioSmar_2019(varargin)
% SUPERVISORIOSMAR_2019 MATLAB code for SupervisorioSmar_2019.fig
%      SUPERVISORIOSMAR_2019, by itself, creates a new SUPERVISORIOSMAR_2019 or raises the existing
%      singleton*.
%
%      H = SUPERVISORIOSMAR_2019 returns the handle to a new SUPERVISORIOSMAR_2019 or the handle to
%      the existing singleton*.
%
%      SUPERVISORIOSMAR_2019('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUPERVISORIOSMAR_2019.M with the given input arguments.
%
%      SUPERVISORIOSMAR_2019('Property','Value',...) creates a new SUPERVISORIOSMAR_2019 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SupervisorioSmar_2019_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SupervisorioSmar_2019_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SupervisorioSmar_2019

% Last Modified by GUIDE v2.5 03-Jul-2019 23:31:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SupervisorioSmar_2019_OpeningFcn, ...
                   'gui_OutputFcn',  @SupervisorioSmar_2019_OutputFcn, ...
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


% --- Executes just before SupervisorioSmar_2019 is made visible.
function SupervisorioSmar_2019_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SupervisorioSmar_2019 (see VARARGIN)

% Choose default command line output for SupervisorioSmar_2019
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SupervisorioSmar_2019 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SupervisorioSmar_2019_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_iniciar.
function btn_iniciar_Callback(hObject, eventdata, handles)
global Stop;
Stop = 1;

%server
global daDfi daDf65

%grups
global group_analogInput
global group_analogOutput
global group_control
global group_digitalInput
global group_digitalOutput

%items inputs
global ItmFit31Ai
global ItmFit32Ai
global ItmLit31Ai
global ItmFit31Intg1
global ItmFit32Intg2
global ItmFit32Intg1
global ItmTy31Ao
global ItmFy31Ao
global ItmTy31Pid
global ItmTy31SpPid ItmTy32SpPid
global ItmManAutoTIC31
global ItmManAutoTIC32

%items outputs
global ItmResetConsumoTq1
global ItmResetConsumoTq2
global ItmResetConsumoTotal

%items control
global ItmTit31Ai
global ItmTit32Ai
global ItmFy32Ao

%items digital inputs
global ItmNivelBaixo
global ItmTempHiTqAquec
global ItmEmergencia
global ItmTempHiTqMist
global ItmLocalBBA1
global ItmLocalBBA2
global ItmTermostato
global ItmChavedeNivel
global ItmSeloBBA1
global ItmDefeitoBBA1
global ItmSeloBBA2
global ItmDefeitoBBA2
global ItmAquecInhibido
global ItmBBA1Deslig
global ItmBBA2Deslig
global ItmBBA1
global ItmBBA2
global ItmTemp
global ItmNivel
global ItmSirene

%items digital outputs
global ItmLigaBBA1
global ItmDesligaBBA1
global ItmLigaBBA2
global ItmDesligaBBA2
global ItmEmergenciaSup
global ItmLigaTesteLamp
global ItmLiberaAquec
global ItmInhibeAquec
global ItmCalaSirene

global ValNivelBaixo ValTempHiTqAquec ValEmergencia ValTempHiTqMist ...
    ValLocalBBA1 ValLocalBBA2 ValTermostato ValChavedeNivel ...
    ValSeloBBA1 ValDefeitoBBA1 ValSeloBBA2 ValDefeitoBBA2 ...
    ValAquecInhibido ValBBA1Deslig ValBBA2Deslig ValBBA1 ...
    ValBBA2 ValTemp ValNivel ValSirene

global ValFit31Ai ValFit32Ai ValLit31Ai ValFit31Intg1 ValFit32Intg2 ...
    ValFit32Intg1 ValTy31Ao ValFy31Ao ValTy31Pid ValTy31SpPid ValFy32SpPid ...
    ValManAutoTIC31 ValManAutoTIC32

global QlyFit31Ai QlyFit32Ai QlyLit31Ai QlyFit31Intg1 QlyFit32Intg2 ...
   QlyFit32Intg1  QlyTy31Ao QlyFy31Ao QlyTy31Pid QlyTy31SpPid ...
   QlyManAutoTIC31 QlyManAutoTIC32

global ValTit31Ai ValTit32Ai ValFy32Ao

global QlyTit31Ai QlyTit32Ai QlyFy32Ao


% initializing OPC client
% creating Client Object OPC
daDfi = opcda('164.41.17.129', 'Smar.DfiOleServer.0');
set(daDfi,'Timeout',100); % delay
connect(daDfi);

daDf65=opcda('164.41.17.129', 'Smar.DF65Server.1');
set(daDf65,'Timeout',100); % delay
connect(daDf65);

%group
group_analogInput = addgroup(daDfi,'AnalogInput');
group_analogOutput = addgroup(daDfi,'AnalogOutput');
group_control = addgroup(daDfi,'Controle');
group_digitalInput = addgroup(daDf65,'DigitalInput');
group_digitalOutput = addgroup(daDf65,'DigitalOutput');

%items analogs inputs
ItmFit31Ai = additem(group_analogInput,'FIT-31_AI1.OUT.VALUE','single');
ItmFit32Ai = additem(group_analogInput,'FIT-32_AI1.OUT.VALUE','single');
ItmLit31Ai = additem(group_analogInput,'LIT-31_AI1.OUT.VALUE','single');
ItmFit31Intg1 = additem(group_analogInput,'FIT-31_INTG1.OUT.VALUE','single');
ItmFit32Intg2 = additem(group_analogInput,'FIT-32_INTG2.OUT.VALUE','single');
ItmFit32Intg1 = additem(group_analogInput,'FIT-32_INTG1.OUT.VALUE','single');
ItmTy31Ao = additem(group_analogInput,'TY-31_AO1.OUT.VALUE','single');
ItmFy31Ao = additem(group_analogInput,'FY-31_AO1.OUT.VALUE','single');
ItmTy31Pid = additem(group_analogInput,'TY-31_PID1.OUT.VALUE','single');
ItmTy31SpPid = additem(group_analogInput,'TY-31_PID1.SP.VALUE','single');
ItmTy32SpPid = additem(group_analogInput,'FY-32_PID1.SP.VALUE','single');
ItmManAutoTIC31 = additem(group_analogInput,'TY-31_PID1.MODE_BLK.TARGET','single');
ItmManAutoTIC32 = additem(group_analogInput,'FY-32_PID1.MODE_BLK.TARGET','single');

%items analogs outputs
ItmResetConsumoTq1 = additem(group_analogOutput,'FIT-31_INTG1.OP_CMD_INT','single');
ItmResetConsumoTq2 = additem(group_analogOutput,'FIT-32_INTG2.OP_CMD_INT','single');
ItmResetConsumoTotal = additem(group_analogOutput,'FIT-32_INTG1.OP_CMD_INT','single');

%items control
ItmTit31Ai = additem(group_control,'TIT-31_AI1.OUT.VALUE','single');
ItmTit32Ai = additem(group_control,'TIT-32_AI1.OUT.VALUE','single');
ItmFy32Ao = additem(group_control,'FY-32_AO1.OUT.VALUE','single');

%DF65
%items digital inputs
ItmNivelBaixo = additem(group_digitalInput,'PD3.A.001.00','int8');
ItmTempHiTqAquec = additem(group_digitalInput,'PD3.A.001.01','int8');
ItmEmergencia = additem(group_digitalInput,'PD3.A.001.04','int8');
ItmTempHiTqMist = additem(group_digitalInput,'PD3.A.002.05','int8');
ItmLocalBBA1 = additem(group_digitalInput,'PD3.E.010.00','int8');
ItmLocalBBA2 = additem(group_digitalInput,'PD3.E.010.01','int8');
ItmTermostato = additem(group_digitalInput,'PD3.E.011.00','int8');
ItmChavedeNivel = additem(group_digitalInput,'PD3.E.011.01','int8');
ItmSeloBBA1 = additem(group_digitalInput,'PD3.E.011.04','int8');
ItmDefeitoBBA1 = additem(group_digitalInput,'PD3.E.011.05','int8');
ItmSeloBBA2 = additem(group_digitalInput,'PD3.E.011.10','int8');
ItmDefeitoBBA2 = additem(group_digitalInput,'PD3.E.011.11','int8');
ItmAquecInhibido = additem(group_digitalInput,'PD3.S.012.00','int8');
ItmBBA1Deslig = additem(group_digitalInput,'PD3.S.012.01','int8');
ItmBBA2Deslig = additem(group_digitalInput,'PD3.S.012.02','int8');
ItmBBA1 = additem(group_digitalInput,'PD3.S.012.03','int8');
ItmBBA2 = additem(group_digitalInput,'PD3.S.012.04','int8');
ItmTemp = additem(group_digitalInput,'PD3.S.012.05','int8');
ItmNivel = additem(group_digitalInput,'PD3.S.012.06','int8');
ItmSirene = additem(group_digitalInput,'PD3.S.012.10','int8');

%items digital outputs
ItmLigaBBA1 = additem(group_digitalOutput,'PD3.A.000.01','int8');
ItmDesligaBBA1 = additem(group_digitalOutput,'PD3.A.000.02','int8');
ItmLigaBBA2 = additem(group_digitalOutput,'PD3.A.000.03','int8');
ItmDesligaBBA2 = additem(group_digitalOutput,'PD3.A.000.04','int8');
ItmEmergenciaSup = additem(group_digitalOutput,'PD3.A.000.05','int8');
ItmLigaTesteLamp = additem(group_digitalOutput,'PD3.A.000.06','int8');
ItmLiberaAquec = additem(group_digitalOutput,'PD3.A.001.03','int8');
ItmInhibeAquec = additem(group_digitalOutput,'PD3.A.001.05','int8');
ItmCalaSirene = additem(group_digitalOutput,'PD3.A.001.06','int8');

while Stop
    %DF65Server
    readGroup_digitalInput = read(group_digitalInput);
    [ValNivelBaixo ValTempHiTqAquec ValEmergencia ValTempHiTqMist ...
        ValLocalBBA1 ValLocalBBA2 ValTermostato ValChavedeNivel ...
        ValSeloBBA1 ValDefeitoBBA1 ValSeloBBA2 ValDefeitoBBA2 ...
        ValAquecInhibido ValBBA1Deslig ValBBA2Deslig ValBBA1 ...
        ValBBA2 ValTemp ValNivel ValSirene] = readGroup_digitalInput.Value;

    %DfiOleServer
    readGroup_analogInput = read(group_analogInput);
    [ValFit31Ai ValFit32Ai ValLit31Ai ValFit31Intg1 ValFit32Intg2 ...
        ValFit32Intg1 ValTy31Ao ValFy31Ao ValTy31Pid ValTy31SpPid ValFy32SpPid...
        ValManAutoTIC31 ValManAutoTIC32] = readGroup_analogInput.Value;

    [QlyFit31Ai QlyFit32Ai QlyLit31Ai QlyFit31Intg1 QlyFit32Intg2 ...
       QlyFit32Intg1  QlyTy31Ao QlyFy31Ao QlyTy31Pid QlyTy31SpPid ...
       QlyManAutoTIC31 QlyManAutoTIC32] = readGroup_analogInput.Quality;

    %control tags
    readGroup_control = read(group_control);
    [ValTit31Ai ValTit32Ai ValFy32Ao] = readGroup_control.Value
    [QlyTit31Ai QlyTit32Ai QlyFy32Ao] = readGroup_control.Quality;
    
    %%
    %======================mostra leituras do tanque 1====================
    set(handles.FIY31,'String',ValFy31Ao); %abertura da valvula 1
    set(handles.LIT31,'String',ValLit31Ai); %nivel do tanque 1
    set(handles.nivelView,'Xtick',[],'Ytick',[],'Ylim',[0 100]);
    axes(handles.nivelView);
    cla(handles.nivelView);
    rectangle('Position',[0,0,5,(round(100*ValLit31Ai/100))+1],'FaceColor','b');
    set(handles.TIY31,'String',ValTy31Ao); %corrente na resistencia
    set(handles.TY31PID1,'String',ValTy31Pid); %liberacao da resistencia
    set(handles.setpointPID1,'String',ValTy31SpPid); %set point temperatura
    set(handles.TIT31PID1,'String',ValTit31Ai); %leitura temperatura 1
    %%
    %======================mostra leituras do tanque 2====================
    set(handles.FIY32,'String',ValFy32Ao); %abertura da valvula 2
    set(handles.TIT32PID2,'String',ValTit32Ai); %temperatura tanque 2
    set(handles.setpointPID2,'String',ValFy32SpPid); %set point temperatura 2
    %%
    pause(1);

end


% --- Executes on button press in btn_sair.
function btn_sair_Callback(hObject, eventdata, handles)
global Stop daDfi daDf65

% Construct a questdlg with three options
choice = questdlg('Deseja sair do processo?', ...
	'Aviso', ...
	'sair','cancelar','cancelar');
% Handle response
switch choice
    case 'cancelar'
        Stop=1;
    case 'sair'
        %disp([choice ' coming right up.'])
        Stop=0;
%         disconnect(daDfi);
%         disconnect(daDf65);
%         delete(daDfi);
%         delete(daDf65);
%         opcreset;
        close all
end



function nada_Callback(hObject, eventdata, handles)
% hObject    handle to nada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nada as text
%        str2double(get(hObject,'String')) returns contents of nada as a double


% --- Executes during object creation, after setting all properties.
function nada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TY31PID1_Callback(hObject, eventdata, handles)
% hObject    handle to TY31PID1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TY31PID1 as text
%        str2double(get(hObject,'String')) returns contents of TY31PID1 as a double


% --- Executes during object creation, after setting all properties.
function TY31PID1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TY31PID1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function setpointPID1_Callback(hObject, eventdata, handles)
% hObject    handle to setpointPID1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of setpointPID1 as text
%        str2double(get(hObject,'String')) returns contents of setpointPID1 as a double


% --- Executes during object creation, after setting all properties.
function setpointPID1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setpointPID1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_liga1.
function btn_liga1_Callback(hObject, eventdata, handles)
global ItmLigaBBA1
write(ItmLigaBBA1,1);
pause(0.5);
write(ItmLigaBBA1,0);


% --- Executes on button press in btn_desliga1.
function btn_desliga1_Callback(hObject, eventdata, handles)
global ItmDesligaBBA1
write(ItmDesligaBBA1,1);
pause(0.5);
write(ItmDesligaBBA1,0);



function kp1_Callback(hObject, eventdata, handles)
% hObject    handle to kp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kp1 as text
%        str2double(get(hObject,'String')) returns contents of kp1 as a double


% --- Executes during object creation, after setting all properties.
function kp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kd1_Callback(hObject, eventdata, handles)
% hObject    handle to kd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kd1 as text
%        str2double(get(hObject,'String')) returns contents of kd1 as a double


% --- Executes during object creation, after setting all properties.
function kd1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ki1_Callback(hObject, eventdata, handles)
% hObject    handle to ki1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ki1 as text
%        str2double(get(hObject,'String')) returns contents of ki1 as a double


% --- Executes during object creation, after setting all properties.
function ki1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ki1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function setpointNivel1_Callback(hObject, eventdata, handles)
% hObject    handle to setpointNivel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of setpointNivel1 as text
%        str2double(get(hObject,'String')) returns contents of setpointNivel1 as a double


% --- Executes during object creation, after setting all properties.
function setpointNivel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setpointNivel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_desliga2.
function btn_desliga2_Callback(hObject, eventdata, handles)
global ItmDesligaBBA2
write(ItmDesligaBBA2,1);
pause(0.5);
write(ItmDesligaBBA2,0);


% --- Executes on button press in btn_liga2.
function btn_liga2_Callback(hObject, eventdata, handles)
global ItmLigaBBA2
write(ItmLigaBBA2,1);
pause(0.5);
write(ItmLigaBBA2,0)



function setpointPID2_Callback(hObject, eventdata, handles)
% hObject    handle to setpointPID2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of setpointPID2 as text
%        str2double(get(hObject,'String')) returns contents of setpointPID2 as a double


% --- Executes during object creation, after setting all properties.
function setpointPID2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setpointPID2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TY32PID2_Callback(hObject, eventdata, handles)
% hObject    handle to TY32PID2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TY32PID2 as text
%        str2double(get(hObject,'String')) returns contents of TY32PID2 as a double


% --- Executes during object creation, after setting all properties.
function TY32PID2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TY32PID2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kp2_Callback(hObject, eventdata, handles)
% hObject    handle to kp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kp2 as text
%        str2double(get(hObject,'String')) returns contents of kp2 as a double


% --- Executes during object creation, after setting all properties.
function kp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kd2_Callback(hObject, eventdata, handles)
% hObject    handle to kd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kd2 as text
%        str2double(get(hObject,'String')) returns contents of kd2 as a double


% --- Executes during object creation, after setting all properties.
function kd2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ki2_Callback(hObject, eventdata, handles)
% hObject    handle to ki2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ki2 as text
%        str2double(get(hObject,'String')) returns contents of ki2 as a double


% --- Executes during object creation, after setting all properties.
function ki2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ki2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_calasirene.
function btn_calasirene_Callback(hObject, eventdata, handles)
global ItmCalaSirene
write(ItmCalaSirene,1);
pause(0.5)
write(ItmCalaSirene,0);

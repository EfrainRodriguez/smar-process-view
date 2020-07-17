function varargout = Smar_MatlabProcessView(varargin)
% SMAR_MATLABPROCESSVIEW MATLAB code for Smar_MatlabProcessView.fig
%      SMAR_MATLABPROCESSVIEW, by itself, creates a new SMAR_MATLABPROCESSVIEW or raises the existing
%      singleton*.
%
%      H = SMAR_MATLABPROCESSVIEW returns the handle to a new SMAR_MATLABPROCESSVIEW or the handle to
%      the existing singleton*.
%
%      SMAR_MATLABPROCESSVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMAR_MATLABPROCESSVIEW.M with the given input arguments.
%
%      SMAR_MATLABPROCESSVIEW('Property','Value',...) creates a new SMAR_MATLABPROCESSVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Smar_MatlabProcessView_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Smar_MatlabProcessView_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Smar_MatlabProcessView

% Last Modified by GUIDE v2.5 28-Nov-2016 15:16:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Smar_MatlabProcessView_OpeningFcn, ...
                   'gui_OutputFcn',  @Smar_MatlabProcessView_OutputFcn, ...
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

% while stop
% 
%    K = get(handles.txtkp,'String');
%    KI = get(handles.txtki,'String');
%    KD  = get(handles.txtkd,'String');
%    SP = get(handles.txtsp,'String');
%    
%    K = str2num(K);
%    KI = str2num(KI);
%    KD = str2num(KD);
%    SP = str2num(SP);
%     
%    nivel_reservatorio_1 = read(ItmLit31Ai);
%    abertura_valvula_1 = read(ItmFy31Ao);
%    
%     abertura = fy31ao.Value;
%     qualidade_do_nivel_2 = fy31ao.Quality;
%     valordonivel = lit31ai.Value;
%     qualidade_do_nivel = lit31ai.Quality;
%     
%     if strcmp(qualidade_do_nivel,'Good: Non-specific')
%     set(handles.activex3,'PortionPercent',valordonivel);
%     end
%     
%     set(handles.txtnivel,'String',valordonivel);
%     set(handles.txtvalvula,'String',abertura);
% 
%     if  strcmp(qualidade_do_nivel_2,'Good: Non-specific')
% 
% persistent firstRun Esaved A B C;
% 
% EK = SP - NI;
% A = ((K + (KI*T/2) + (KD/T)));
% B = ((KI*T/2) - K - ((2*KD)/T));
% C = (KD/T);
% 
% if isempty(firstRun)
%     Esaved = zeros (2, 1);
%     firstRun = 1;
%     Esaved(firstRun) = EK;
%     Esaved(firstRun + 1) = EK;
%     M = (A + B+ C)*EK;
%  
% else 
%     aux = M + A*EK + B*Esaved(1) + c*Esaved(2);
%     Esaved(2) = Esaved (1);
%     Esaved(1) = EK;
%     M = aux;
%     
% end
% 
%        write(abertura,M);
%         set(handles.activex4,'VariableID',0);
%         set(handles.activex4,'Y', SP);
%         set(handles.activex4,'VariableID',1);
%         set(handles.activex4,'Y', M);
%         set(handles.activex4,'VariableID',2);
%         set(handles.activex4,'Y', valordonivel); 
%         EK_1 = EK;
% end

% --- Executes on button press in pbsair.


% End initialization code - DO NOT EDIT


% --- Executes just before Smar_MatlabProcessView is made visible.
function Smar_MatlabProcessView_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Smar_MatlabProcessView (see VARARGIN)

% Choose default command line output for Smar_MatlabProcessView
handles.output = hObject;

% ------------------------INTERFACE INICIALIZING---------------------------

% screen background
ah=axes('unit','normalized','position',[0,0,1,1]);
bg=imread('Smar-ProcessView_draw.png'); imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');

% interface centering.
t_pantalla = get(0,'ScreenSize'); 
p_interfaz=get(gcf,'Position');   
xr=t_pantalla(3) - p_interfaz(3); 
xp=round(xr/2);   
yr=t_pantalla(4) - p_interfaz(4); 
yp=round(yr/2);  
set(gcf,'Position',[xp yp p_interfaz(3) p_interfaz(4)]);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Smar_MatlabProcessView wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Smar_MatlabProcessView_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startPump1.
function startPump1_Callback(hObject, eventdata, handles)
global ItmLigaBBA1
% hObject    handle to startPump1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
write(ItmLigaBBA1,1);
pause(0.5);
write(ItmLigaBBA1,0);



% --- Executes on button press in offPump1.
function offPump1_Callback(hObject, eventdata, handles)
global ItmDesligaBBA1
% hObject    handle to offPump1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
write(ItmDesligaBBA1,1);
pause(0.5);
write(ItmDesligaBBA1,0);

% --- Executes on button press in startPump2.
function startPump2_Callback(hObject, eventdata, handles)
global ItmLigaBBA2
% hObject    handle to startPump2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
write(ItmLigaBBA2,1);
pause(0.5);
write(ItmLigaBBA2,0);


% --- Executes on button press in offPump2.
function offPump2_Callback(hObject, eventdata, handles)
global ItmDesligaBBA2
% hObject    handle to offPump2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
write(ItmDesligaBBA2,1);
pause(0.5);
write(ItmDesligaBBA2,0);


% --- Executes on button press in switchOnligth.
function switchOnligth_Callback(hObject, eventdata, handles)
% hObject    handle to switchOnligth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmLigaTesteLamp
write(ItmLigaTesteLamp,1);


% --- Executes on button press in switchOffligth.
function switchOffligth_Callback(hObject, eventdata, handles)
% hObject    handle to switchOffligth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmLigaTesteLamp
write(ItmLigaTesteLamp,0);


% --- Executes on button press in turnOnheater.
function turnOnheater_Callback(hObject, eventdata, handles)
% hObject    handle to turnOnheater (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmLiberaAquec
write(ItmLiberaAquec,1);
pause(0.5)
write(ItmLiberaAquec,0);


% --- Executes on button press in turnOffheater.
function turnOffheater_Callback(hObject, eventdata, handles)
% hObject    handle to turnOffheater (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmInhibeAquec
write(ItmInhibeAquec,1);
pause(0.5)
write(ItmInhibeAquec,0);


% --- Executes on button press in turnOffhooter.
function turnOffhooter_Callback(hObject, eventdata, handles)
% hObject    handle to turnOffhooter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmCalaSirene
write(ItmCalaSirene,1);
pause(0.5)
write(ItmCalaSirene,0);


% --- Executes on button press in initOPCclient.
function initOPCclient_Callback(hObject, eventdata, handles)

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

global flagStop flag_plotPID1 flag_plotPID2
flagStop=1;
flag_plotPID1 = 0;
flag_plotPID2 = 0;

global i_plot i_store
i_plot=1;
i_store=1;
global flag_read_init
flag_read_init=0;

newErro = 0;
oldErro = 0;
oldAcao = 0;
newAcao = 0;
OldValFy32Ao = 0;

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

while flagStop
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


%pid 1
    newErro=ValTy31SpPid - ValTit31Ai;
    newAcao=pid_control(newErro,oldErro,oldAcao,1)
    ValFy31Ao = abs(newAcao);
    oldErro = newErro;
    oldAcao = newAcao; 
    NewValFy32Ao = ValFy31Ao;
    
    if abs(OldValFy32Ao-NewValFy32Ao) > 0.05
       write(ItmFy31Ao,ValFy31Ao)
       OldValFy32Ao = NewValFy32Ao;
    end
    write(ItmFy31Ao,ValFy31Ao);
 %----------------------------------------------------




%----------------------tic 31-------------------------
if ValManAutoTIC31 == 8 %automatic control
    
    set(handles.TY31PID1,'Style','text');
    set(handles.manualPID1,'BackgroundColor',[0.94 0.94 0.94]);
    set(handles.automaticPID1,'BackgroundColor',[0 1 0]);
    set(handles.TY31PID1,'String',ValTy31Pid);
    
elseif ValManAutoTIC31 == 16 %manual control
    set(handles.TY31PID1,'Style','edit');
    set(handles.automaticPID1,'BackgroundColor',[0.94 0.94 0.94]);
    set(handles.manualPID1,'BackgroundColor',[0 1 0]);
    set(handles.TY31PID1,'String',ValTy31Pid);
    
end

%----------------------tic 32--------------------
if ValManAutoTIC32 == 8 %automatic control
    
    set(handles.TY32PID2,'Style','text');
    set(handles.manualPID2,'BackgroundColor',[0.94 0.94 0.94]);
    set(handles.automaticPID2,'BackgroundColor',[0 1 0]);
    set(handles.TY32PID2,'String',ValFy32SP);
    
elseif ValManAutoTIC32 == 16 %manual control
    set(handles.TY32PID2,'Style','edit');
    set(handles.automaticPID2,'BackgroundColor',[0.94 0.94 0.94]);
    set(handles.manualPID2,'BackgroundColor',[0 1 0]);
    
%     newErro=ValFy32SpPid - ValTit32Ai;
%     newAcao=pid_control(newErro,oldErro,oldAcao,2) 
%     ValFy32Ao = abs(newAcao);
%     oldErro = newErro; 
%     oldAcao = newAcao; 
%     NewValFy32Ao = ValFy32Ao;
%     
%     if abs(OldValFy32Ao-NewValFy32Ao) > 0.05
%        write(ItmFy32Ao,ValFy32Ao)
%        OldValFy32Ao = NewValFy32Ao;
%     end
%     write(ItmFy32Ao,ValFy32Ao);
    
end


%---------------------visualizing...

%----------------------tank1-heat-----------------------

%input flow
set(handles.FIT31,'String',ValFit31Ai);
%intake
set(handles.TQ1,'String',ValFit31Intg1);
%current
set(handles.TIY31,'String',ValTy31Ao);
%valve percentage
set(handles.FIY31,'String',ValFy31Ao);
%level
set(handles.LIT31,'String',ValLit31Ai)
set(handles.nivelView,'Xtick',[],'Ytick',[],'Ylim',[0 100]);
axes(handles.nivelView);
cla(handles.nivelView);
rectangle('Position',[0,0,5,(round(100*ValLit31Ai/100))+1],'FaceColor','b');
%tempperature
set(handles.TIT31,'String',ValTit31Ai);
%TIC1
set(handles.setpointPID1,'String',ValTy31SpPid);
set(handles.TIT31PID1,'String',ValTit31Ai);
set(handles.TY31PID1,'String',ValTy31Pid);

%-----------------------tank2-mixture---------------------------
%temperature
set(handles.TIT32,'String',ValTit32Ai);
%valve percentage
set(handles.FIY32,'String',ValFy32Ao);
%input flow
set(handles.FIT32,'String',ValFit32Ai);
%intake
set(handles.TQ2,'String',ValFit32Intg2);
%TIC32
set(handles.setpointPID2,'String',ValFy32SpPid);
set(handles.TIT32PID2,'String',ValTit32Ai);
set(handles.TY32PID2,'String',ValFy32Ao);

%----------------total intake-----------
set(handles.TQT,'String',ValFit32Intg1);

%----------------------------pump1----------------------
%state pump1
if ValBBA1Deslig
    set(handles.statePump1,'BackgroundColor',[0 1 0]);
    set(handles.textStatePump1,'String','Bomba Ligada');
else
    set(handles.statePump1,'BackgroundColor',[0 0.6 0.2]);
    set(handles.textStatePump1,'String','Bomba Desligada');
end
%local BBA1
if ValLocalBBA1
    set(handles.LBBA1,'BackgroundColor',[0 1 0]);
    set(handles.textLocalBBA1,'String','Remoto');
else
    set(handles.LBBA1,'BackgroundColor',[0 0.6 0.2]);
    set(handles.textLocalBBA1,'String','Local');
end
%---
if ValSeloBBA1
    set(handles.SBBA1,'BackgroundColor',[0 1 0]);
else
    set(handles.SBBA1,'BackgroundColor',[0 0.6 0.2]);
end
%fail BBA1
if ValDefeitoBBA1
    set(handles.failPump1,'BackgroundColor',[1 0 0]);
else
    set(handles.failPump1,'BackgroundColor',[0.8 0 0]);
end

%----------------------------pump2----------------------
%state pump2
if ValBBA2Deslig
    set(handles.statePump2,'BackgroundColor',[0 1 0]);
    set(handles.textStatePump2,'String','Bomba Ligada');
else
    set(handles.statePump2,'BackgroundColor',[0 0.6 0.2]);
    set(handles.textStatePump2,'String','Bomba Desligada');
end
%local BBA2
if ValLocalBBA2
    set(handles.LBBA2,'BackgroundColor',[0 1 0]);
    set(handles.textLocalBBA2,'String','Remoto');
else
    set(handles.LBBA2,'BackgroundColor',[0 0.6 0.2]);
    set(handles.textLocalBBA2,'String','Local');
end
%---
if ValSeloBBA2
    set(handles.SBBA2,'BackgroundColor',[0 1 0]);
else
    set(handles.SBBA2,'BackgroundColor',[0 0.6 0.2]);
end
%fail BBA2
if ValDefeitoBBA2
    set(handles.failPump2,'BackgroundColor',[1 0 0]);
else
    set(handles.failPump2,'BackgroundColor',[0.8 0 0]);
end

%--------------------------test ligth-----------------------
%BBA1
if ValBBA1
    set(handles.flagBBA1,'BackgroundColor',[0 1 0]);
else
    set(handles.flagBBA1,'BackgroundColor',[0 0.6 0.2]);
end
%BBA2
if ValBBA2
    set(handles.flagBBA2,'BackgroundColor',[0 1 0]);
else
    set(handles.flagBBA2,'BackgroundColor',[0 0.6 0.2]);
end
%temp
if ValTemp
    set(handles.flagTemp,'BackgroundColor',[0 1 0]);
else
    set(handles.flagTemp,'BackgroundColor',[0 0.6 0.2]);
end
%level
if ValNivel
    set(handles.flagLevel,'BackgroundColor',[0 1 0]);
else
    set(handles.flagLevel,'BackgroundColor',[0 0.6 0.2]);
end

%---------------------------heater---------------------
if ValAquecInhibido
    set(handles.stateHeater,'BackgroundColor',[0 0.6 0.2]);
    set(handles.textStateHeater,'String','Aquecedor Inhibido');
else
    set(handles.stateHeater,'BackgroundColor',[0 1 0]);
    set(handles.textStateHeater,'String','Aquecedor Liberado');
end

%-----------------------hooter------------------------
if ValSirene
    set(handles.textStateHooter,'String','Sirene Ativada');
    set(handles.stateHooter,'BackgroundColor',[1 0 0]);
else
    set(handles.textStateHooter,'String','Sirene Calada');
    set(handles.stateHooter,'BackgroundColor',[0.8 0 0]);
end

%------------------------security----------------
%thermostat
if ValTermostato
    set(handles.thermostat,'BackgroundColor',[1 0 0]);
else
    set(handles.thermostat,'BackgroundColor',[0.8 0 0]);
end
%level lock
if ValChavedeNivel
    set(handles.levelLock,'BackgroundColor',[1 0 0]);
else
    set(handles.levelLock,'BackgroundColor',[0.8 0 0]);
end


%----------------------------alarms--------------------------
%high temperature heater
if ValTempHiTqAquec
    set(handles.highTemperatureHeater,'BackgroundColor',[1 0 0]);
else
    set(handles.highTemperatureHeater,'BackgroundColor',[0.8 0 0]);
end
%high temperature mixture
if ValTempHiTqMist
    set(handles.highTemperatureMixture,'BackgroundColor',[1 0 0]);
else
    set(handles.highTemperatureMixture,'BackgroundColor',[0.8 0 0]);
end
%low level
if ValNivelBaixo
    set(handles.lowLevel,'BackgroundColor',[1 0 0]);
else
    set(handles.lowLevel,'BackgroundColor',[0.8 0 0]);
end
%heater off
if ValAquecInhibido
    set(handles.heaterOff,'BackgroundColor',[1 0 0]);
else
    set(handles.heaterOff,'BackgroundColor',[0.8 0 0]);
end
%emergency
if ValEmergencia
    set(handles.emergency,'BackgroundColor',[1 0 0]);
else
    set(handles.emergency,'BackgroundColor',[0.8 0 0]);
end

%-------------------------storing----------------------

    storing_setpointPID1(i_store)=ValTy31SpPid;
    storing_tempPID1(i_store)=ValTy31SpPid
    storing_percentPID1(i_store)=ValTy31SpPid;
    
    storing_setpointPID2(i_store)=ValFy32SpPid;
    storing_tempPID2(i_store)=ValTit32Ai;
    storing_percentPID2(i_store)=ValFy32Ao;
    
    time_clock_storing=clock; 
    time_storing(i_store)=duration(time_clock_storing(4:6))
    
    i_store=i_store+1;

%-------------------------ploting--------------------------
if flag_plotPID1
    
    figure(2)
    
    time_clock=clock; time_seconds = (time_clock(5)*60)+time_clock(6);
    
    if flag_read_init == 0
        px_init = time_seconds;
        py_init_1 = ValTy31SpPid;
        py_init_2 = ValTit31Ai;
        py_init_3 = ValTy31Pid;
        x_axis=time_seconds;
        flag_read_init = 1
    end
    
    px_end=(time_clock(5)*60)+time_clock(6);
    py_end_1=ValTy31SpPid;
    py_end_2=ValTit31Ai;
    py_end_3=ValTy31Pid;
   
    
    if px_end>=x_axis+1000.0
        plot([px_init px_end],[py_init_1 py_end_1],'b'), axis([x_axis x_axis+1000.0 0 100])
        plot([px_init px_end],[py_init_2 py_end_2],'y'), axis([x_axis x_axis+1000.0 0 100])
        plot([px_init px_end],[py_init_3 py_end_3],'g'), axis([x_axis x_axis+1000.0 0 100])
        set(gcf,'Color','w'), xlabel('Tempo (s)'), ylabel('Grandezas'),title('TIC31'), grid on;
        hold on
        px_init=px_end;
        py_init_1=py_end_1;
        py_init_2=py_end_2;
        py_init_3=py_end_3;
        x_axis=x_axis+0.2;
        
    else
        plot([px_init px_end],[py_init_1 py_end_1],'b'), axis([x_axis x_axis+1000.0 0 100])
        plot([px_init px_end],[py_init_2 py_end_2],'y'), axis([x_axis x_axis+1000.0 0 100])
        plot([px_init px_end],[py_init_3 py_end_3],'g'), axis([x_axis x_axis+1000.0 0 100])
        set(gcf,'Color','w'), xlabel('Tempo (s)'), ylabel('Grandezas'),title('TIC31'), grid on;
        hold on
        px_init=px_end;
        py_init1=py_end_1;
        py_init2=py_end_2;
        py_init3=py_end_3;
        
    end

end

if flag_plotPID2
    figure(2)
    
    time_clock=clock; time_seconds = (time_clock(5)*60)+time_clock(6);
    
    if flag_read_init == 0
        px_init = time_seconds;
        py_init_1 = ValFy32SpPid;
        py_init_2 = ValTit32Ai;
        py_init_3 = ValFy32Ao;
        x_axis=time_seconds;
        flag_read_init = 1
    end
    
    px_end=(time_clock(5)*60)+time_clock(6);
    py_end_1=ValFy32SpPid;
    py_end_2=ValTit32Ai;
    py_end_3=ValFy32Ao;
    
    if px_end>=x_axis+1000.0
        plot([px_init px_end],[py_init_1 py_end_1],'b'), axis([x_axis x_axis+1000.0 0 100])
        plot([px_init px_end],[py_init_2 py_end_2],'y'), axis([x_axis x_axis+1000.0 0 100])
        plot([px_init px_end],[py_init_3 py_end_3],'g'), axis([x_axis x_axis+1000.0 0 100])
        set(gcf,'Color','w'), xlabel('Tempo (s)'), ylabel('Grandezas'),title('TIC32'), grid on;
        hold on
        px_init=px_end;
        py_init_1=py_end_1;
        py_init_2=py_end_2;
        py_init_3=py_end_3;
        x_axis=x_axis+0.2;
        
    else
        plot([px_init px_end],[py_init_1 py_end_1],'b'), axis([x_axis x_axis+1000.0 0 100])
        plot([px_init px_end],[py_init_2 py_end_2],'y'), axis([x_axis x_axis+1000.0 0 100])
        plot([px_init px_end],[py_init_3 py_end_3],'g'), axis([x_axis x_axis+1000.0 0 100])
        set(gcf,'Color','w'), xlabel('Tempo (s)'), ylabel('Grandezas'),title('TIC32'), grid on;
        hold on
        px_init=px_end;
        py_init1=py_end_1;
        py_init2=py_end_2;
        py_init3=py_end_3;
        
    end

end
pause(0.1);
end


% hObject    handle to initOPCclient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in logOff.
function logOff_Callback(hObject, eventdata, handles)
% hObject    handle to logOff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flagStop daDfi daDf65

% Construct a questdlg with three options
choice = questdlg('Deseja sair do processo?', ...
	'Aviso', ...
	'sair','cancelar','cancelar');
% Handle response
switch choice
    case 'cancelar'
        flagStop=1;
    case 'sair'
        %disp([choice ' coming right up.'])
        flagStop=0;
%         disconnect(daDfi);
%         disconnect(daDf65);
%         delete(daDfi);
%         delete(daDf65);
%         opcreset;
        close all

%     storing_setpointPID1(i_store)=ValTy31SpPid;
%     storing_tempPID1(i_store)=ValTy31SpPid;
%     storing_percentPID1(i_store)=ValTy31SpPid;
%     
%     storing_setpointPID2(i_store)=ValFy32SpPid;
%     storing_tempPID2(i_store)=ValTit32Ai;
%     storing_percentPID2(i_store)=ValFy32Ao;
%     
%     time_clock_storing=clock; 
%     time_storing(i_store)=duration(time_clock_storing(4:6));        
end

function setpointPID1_Callback(hObject, eventdata, handles)
% hObject    handle to setpointPID1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ValTy31SpPid ItmTy31SpPid
ValTy31SpPid = get(hObject,'String');
write(ItmTy31SpPid,ValTy31SpPid); % setpoint temperature of the heater tank
set(hObject,'String',ValTy31SpPid);

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



function setpointPID2_Callback(hObject, eventdata, handles)
% hObject    handle to setpointPID2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ValFy32Sp
ValFy32Sp = str2num(get(hObject,'String'));

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



function TY31PID1_Callback(hObject, eventdata, handles)
% hObject    handle to TY31PID1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ValTy31Pid ItmTy31Pid
ValTy31Pid = get(hObject,'String');
write(ItmTy31Pid,ValTy31Pid);
set(hObject,'String',ValTy31Pid);

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



function TY32PID2_Callback(hObject, eventdata, handles)
% hObject    handle to TY32PID2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ValFy32Ao ItmFy32Ao
ValFy32Ao = get(hObject,'String');
write(ItmFy32Ao,ValFy32Ao);

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


% --- Executes on button press in resetTQT.
function resetTQT_Callback(hObject, eventdata, handles)
% hObject    handle to resetTQT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmResetConsumoTotal
write(ItmResetConsumoTotal,1);


% --- Executes on button press in resetTQ1.
function resetTQ1_Callback(hObject, eventdata, handles)
% hObject    handle to resetTQ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmResetConsumoTq1
write(ItmResetConsumoTq1,1);


% --- Executes on button press in resetTQ2.
function resetTQ2_Callback(hObject, eventdata, handles)
% hObject    handle to resetTQ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmResetConsumoTq2
write(ItmResetConsumoTq2,1);


% --- Executes on button press in automaticPID2.
function automaticPID2_Callback(hObject, eventdata, handles)
% hObject    handle to automaticPID2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ValManAutoTIC32
ValManAutoTIC32 = 8;


% --- Executes on button press in manualPID2.
function manualPID2_Callback(hObject, eventdata, handles)
% hObject    handle to manualPID2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ValManAutoTIC32
ValManAutoTIC32 = 16;


% --- Executes on button press in automaticPID1.
function automaticPID1_Callback(hObject, eventdata, handles)
% hObject    handle to automaticPID1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmManAutoTIC31
write(ItmManAutoTIC31,8);


% --- Executes on button press in manualPID1.
function manualPID1_Callback(hObject, eventdata, handles)
% hObject    handle to manualPID1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ItmManAutoTIC31
write(ItmManAutoTIC31,16);


% --- Executes during object creation, after setting all properties.
function nivelView_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nivelView (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate nivelView


% --- Executes on button press in plotPID2.
function plotPID2_Callback(hObject, eventdata, handles)
% hObject    handle to plotPID2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag_plotPID1 flag_plotPID2
if flag_plotPID2
    close(2)
    flag_plotPID2 = 0;
else
    if flag_plotPID1
        flag_plotPID1 = 0;
        close(2)
    end
    flag_plotPID2 = 1;
end


% --- Executes on button press in plotPID1.
function plotPID1_Callback(hObject, eventdata, handles)
% hObject    handle to plotPID1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global flag_plotPID1 flag_plotPID2 i_plot flag_read_init
if flag_plotPID1
    close(2)
    flag_plotPID1 = 0;
    i_plot=1;
else
    if flag_plotPID2
        flag_plotPID2 = 0;
        close(2)
    end
    flag_plotPID1 = 1;
    flag_read_init=0;
    i_plot=1;
end

function aNewAcao = pid_control(aNewErro,aOldErro, aOldAcao,flag_pid)

if flag_pid==1
    Kp = 2.3544;
%     Tr = 3.9401;
%     Td = 2.4188;
    K1 = Kp;
    K2 = 3.9401;
    K3 = 2.4188;
    Bias = -9;
else if flag_pid==2
    Kp = 1.3293;
    Tr = 0.9974;
    Td = 0.1028;
    K1 = Kp;
    K2 = (Kp/Tr);
    K3 = Td*Kp;
    Bias = 0;
    end
end


aNewAcaoAux=(K1+2*K2+K3/2)*aNewErro+K3*2*aOldErro+K2*aOldAcao+Bias;
if aNewAcaoAux < 0
    if aNewAcaoAux < -105
        aNewAcao = -105;
    else
    aNewAcao = aNewAcaoAux;
    end
else
    aNewAcao = 0;
end
    

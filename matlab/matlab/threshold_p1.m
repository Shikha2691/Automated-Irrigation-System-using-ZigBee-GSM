function varargout = threshold_p1(varargin)
% THRESHOLD_P1 MATLAB code for threshold_p1.fig
%      THRESHOLD_P1, by itself, creates a new THRESHOLD_P1 or raises the existing
%      singleton*.
%
%      H = THRESHOLD_P1 returns the handle to a new THRESHOLD_P1 or the handle to
%      the existing singleton*.
%
%      THRESHOLD_P1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THRESHOLD_P1.M with the given input arguments.
%
%      THRESHOLD_P1('Property','Value',...) creates a new THRESHOLD_P1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before threshold_p1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to threshold_p1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help threshold_p1

% Last Modified by GUIDE v2.5 03-May-2016 13:32:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @threshold_p1_OpeningFcn, ...
                   'gui_OutputFcn',  @threshold_p1_OutputFcn, ...
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


% --- Executes just before threshold_p1 is made visible.
function threshold_p1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to threshold_p1 (see VARARGIN)

% Choose default command line output for threshold_p1
handles.output = hObject;
global n1 n2
n1=0;
n2=0;
set(handles.edit4,'string','100');
set(handles.edit5,'string','100');
set(handles.edit6,'string','100000');
set(handles.edit14,'string','100000');
set(handles.edit10,'string','100');
set(handles.edit11,'string','100');
set(handles.edit12,'string','100000');
set(handles.edit16,'string','100000');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes threshold_p1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = threshold_p1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ser humidity1 Temperature1 Moisture1 Pressure1 ax ax1 ax2 ax3 val tim1ax1 tim2ax2 tim3ax3 tim4ax4 ser_gsm
global Thumidity1 TTemperature1 TMoisture1 TPressure1 Tax Tax1 Tax2 Tax3 Ttim1ax1 Ttim2ax2 Ttim3ax3 Ttim4ax4
global n1 n2 
val=0;
% flag1=0; flag2=0; flag3=0;
instrreset; 
ser=serial('COM6','Baudrate',9600);
fopen(ser);

ser_gsm=serial('COM8','Baudrate',9600);
ser_gsm.Timeout=0.5; 
ser_gsm.BytesAvailableFcnMode = 'terminator';
% handles.ser_gsm.BytesAvailableFcn = {@send};
handles.gsm=ser_gsm;
ser_gsm.BytesAvailableFcn={@send,handles};
fopen(ser_gsm);


connec1 = database('anjum','root','1234');
% con2path ='C:\Program Files (x86)\MySQL\MySQL Server 5.0\data\newdata';
count=1;count1=1;count2=1;count3=1;
Tcount=1;Tcount1=1;Tcount2=1;Tcount3=1;
clear ax ax1 ax2 humiidity Temperature Moisture Pressure


ss=0;
flag1=0; flag2=0; flag3=0;
msg_send_interval=30;
tic;
while(1) 
    r1=str2double(get(handles.edit4,'string'));
    r2=str2double(get(handles.edit5,'string'));
    r3=str2double(get(handles.edit6,'string'));
    r4=str2double(get(handles.edit14,'string'));

    Tr1=str2double(get(handles.edit10,'string'));
    Tr2=str2double(get(handles.edit11,'string'));
    Tr3=str2double(get(handles.edit12,'string'));
    Tr4=str2double(get(handles.edit16,'string'));
    d=fscanf(ser,'%s'); 
    disp(d);
    pause(0.1);

if(~isempty(d))
    if(d(1)=='1')
        if d(2)=='F' 
            msgbox('fire!!','ALERT!!','warn');
            if(fix(toc)>msg_send_interval)
            fprintf(ser,'%s','@1B');
            send_message(ser_gsm,'Fire in system1');
            tic
            end

        elseif d(2)=='H'
            v1=uint8(d(3))-48;
            v2=uint8(d(4))-48;
            num=v1*10+v2;
            if num~=0
                humidity1(count,1)=num;
                 ax1(count)=count;
                 tim1ax1(count)=datenum(clock);
                 count=count+1;
            end
            set(handles.edit1,'string',num);
            disp('H1');
            disp(num);
            disp(r1);
            if(num>r1 && (fix(toc)>msg_send_interval))
                msgbox('HUMIDITY is high','WARNING','warn');
                send_message(ser_gsm,'Humidity1 is high');
                fprintf(ser,'%s','@1B');
                tic;  
            end
            
        elseif d(2)=='T'
            v1=uint8(d(3))-48;
            v2=uint8(d(4))-48;
            num1=v1*10+v2;
            if num1~=0
                Temperature1(count1,1)=num1;
                ax(count1)=count1;
                tim2ax2(count1)=datenum(clock);
                count1=count1+1;
            end
            set(handles.edit2,'string',num1);
            disp('T1');
            disp(num1);
            if(num1>r2 && (fix(toc)>msg_send_interval))
                msgbox('TEMPERATURE is high','WARNING','warn');
                send_message(ser_gsm,'Temperature1 is high');
                fprintf(ser,'%s','@1B');
                tic;  
            end
        elseif d(2)=='M'
            v1=uint8(d(3))-48;
            v2=uint8(d(4))-48;
            v3=uint8(d(5))-48;
            v4=uint8(d(6))-48;
            % num2=v1*1000+v2*100+v3*10+v4;
            num2=double(double(v1)*1000+double(v2)*100+double(v3)*10+double(v4));
            disp('M1');
            disp(num2);
            if num2~=0
                Moisture1(count2,1)=num2;
                ax2(count2)=count2;
                tim3ax3(count2)=datenum(clock);
                count2=count2+1;
            end
            set(handles.edit3,'string',num2);
            if(num2>r3 && (fix(toc)>msg_send_interval))
                msgbox('MOISTURE is high','WARNING','warn');
                send_message(ser_gsm,'Moisture1 is high');
                fprintf(ser,'%s','@1B');
                tic;  
            end

        elseif d(2)=='P'
            v1=uint8(d(3))-48;
            v2=uint8(d(4))-48;
            v3=uint8(d(5))-48;
            v4=uint8(d(6))-48;
            v5=uint8(d(7))-48;
            num3=double(double(v1)*10000+double(v2)*1000+double(v3)*100+double(v4)*10+double(v5));
            disp('P1');
            disp(num3);
            if num3~=0
                Pressure1(count3,1)=num3;
                ax3(count3)=count3;
                tim4ax4(count3)=datenum(clock);
                count3=count3+1;
            end
            set(handles.edit13,'string',num3);
            if(num3>r4 && (fix(toc)>msg_send_interval))
                msgbox('PRESSURE is high','WARNING','warn');
                send_message(ser_gsm,'Pressure1 is high');
                fprintf(ser,'%s','@1B');
                tic;  
            end         
        end
    end

    val=get(handles.popupmenu1,'Value');
    if n1==1
        if(val==1)
        elseif(val==2)
            ss=size(tim1ax1,2);
            axes(handles.axes1);
            plot(tim1ax1,humidity1(1:ss,1),'linewidth',3);
            ylim([0 60]);
            title('Real time Humidity Data');
            ylabel('Humidity');
            xlabel('Time');
            datetick('x','HH:MM:SS','keepticks');
            pause(0.1);
        elseif(val==3)
            ss=size(tim2ax2,2);
            axes(handles.axes2);
            plot(tim2ax2,Temperature1(1:ss,1),'linewidth',3);  
            ylim([0 50]);
            title('Real time Temperature Data');
            ylabel('Temp');
            xlabel('Time');
            datetick('x','HH:MM:SS','keepticks');
            pause(0.1);
        elseif(val==4)
            ss=size(tim3ax3,2);
            axes(handles.axes3);
            plot(tim3ax3,Moisture1(1:ss,1),'linewidth',3);  
            title('Real time Soil Moisture Data');
            ylabel('Moisture');
            xlabel('Time');
            ylim([0 2000]);
            datetick('x','HH:MM:SS','keepticks');
            pause(0.1);
        elseif(val==5)
            ss=size(tim4ax4,2);
            axes(handles.axes4);
            plot(tim4ax4,Pressure1(1:ss,1),'linewidth',3);  
            title('Real time Pressue Data');
            ylabel('Pressure');
            xlabel('Time');
            ylim([0 2000]);
            datetick('x','HH:MM:SS','keepticks');
            pause(0.1);     
        end
    end

    % curs = exec(connec1,'select * from sensor1');
    % curs = fetch(curs);
    % curs.Data;
    colnames = {'Humidity','Temperature','Moisture','Date'};
    % if isempty(humidity1)
    %    humidity1(end)=10; 
    % end
    % ss = ss+1;
    % data = {humidity1(end) Temperature1(end) Moisture1(end) datestr(now,'mmmm dd, yyyy HH:MM:SS AM')};
    % tablename = 'sensor1';
    % datainsert(connec1,tablename,colnames,data);


    %% code for node 2:


    if(d(1)=='2')
        if d(2)=='F' 
            msgbox('fire!!','ALERT!!','warn');
            if(fix(toc)>msg_send_interval)
            fprintf(ser,'%s','@1B');
            send_message(ser_gsm,'Fire in system2');
            tic
            end
        elseif d(2)=='H'
            v1=uint8(d(3))-48;
            v2=uint8(d(4))-48;
            num=v1*10+v2;
            if num~=0
                Thumidity1(Tcount,1)=num;
                Tax1(Tcount)=Tcount;
                Ttim1ax1(Tcount)=datenum(clock);
                Tcount=Tcount+1;
            end
            set(handles.edit7,'string',num);
            disp('2H');
            disp(num);
            if(num>Tr1 && (fix(toc)>msg_send_interval))
                msgbox('HUMIDITY is high','WARNING','warn');
                send_message(ser_gsm,'Humidity2 is high');
                fprintf(ser,'%s','@2B');
                tic;  
            end

        elseif d(2)=='T'
            v1=uint8(d(3))-48;
            v2=uint8(d(4))-48;
            num1=v1*10+v2;
            if num1~=0
                TTemperature1(Tcount1,1)=num1;
                Tax(Tcount1)=Tcount1;
                Ttim2ax2(Tcount1)=datenum(clock);
                Tcount1=Tcount1+1;
            end
            set(handles.edit8,'string',num1);
            disp('2T');
            disp(num1);
            if(num1>Tr2 && (fix(toc)>msg_send_interval))
                msgbox('TEMPERATURE is high','WARNING','warn');
                send_message(ser_gsm,'Temperature2 is high');
                fprintf(ser,'%s','@2B');
                tic;  
            end

        elseif d(2)=='M'
            v1=uint8(d(3))-48;
            v2=uint8(d(4))-48;
            v3=uint8(d(5))-48;
            v4=uint8(d(6))-48;
            % num2=v1*1000+v2*100+v3*10+v4;
            num2=double(double(v1)*1000+double(v2)*100+double(v3)*10+double(v4));
            disp('2M');
            disp(num2);
            if num2~=0
                TMoisture1(Tcount2,1)=num2;
                Tax2(Tcount2)=Tcount2;
                Ttim3ax3(Tcount2)=datenum(clock);
                Tcount2=Tcount2+1;
            end
            set(handles.edit9,'string',num2);
            if(num2>Tr3 && (fix(toc)>msg_send_interval))
                msgbox('MOISTURE is high','WARNING','warn');
                send_message(ser_gsm,'Moisture2 is high');
                fprintf(ser,'%s','@2B');
                tic;  
            end
            
        elseif d(2)=='P'
            v1=uint8(d(3))-48;
            v2=uint8(d(4))-48;
            v3=uint8(d(5))-48;
            v4=uint8(d(6))-48;
            v5=uint8(d(7))-48;
            % num2=v1*1000+v2*100+v3*10+v4;
            num3=double(double(v1)*10000+double(v2)*1000+double(v3)*100+double(v4)*10+double(v5));
            disp('P2');
            disp(num3);
            if num3~=0
                TPressure1(Tcount3,1)=num3;
                Tax3(Tcount3)=Tcount3;
                Ttim4ax4(Tcount3)=datenum(clock);
                Tcount3=Tcount3+1;
            end
            set(handles.edit15,'string',num3);
            if(num3>Tr4 && (fix(toc)>msg_send_interval))
                msgbox('PRESSURE is high','WARNING','warn');
                send_message(ser_gsm,'Pressure2 is high');
                fprintf(ser,'%s','@2B');
                tic;  
            end        
            %         if(num2>r3 && flag3==0)
            %         msgbox('Moisture level is high','WARNING','warn');
            %         fwrite(ser,'B');
            %         data='Moisture level is high';
            %         send_message(ser_gsm,data);
            %         tic;
            %         flag3=1;
            %         end
            %         if(toc>600 && num2>r1 && flag3==1)
            %         msgbox('Moisture level is high','WARNING','warn');
            %         data='Moisture is high';
            %         send_message(ser_gsm,data);
            %         flag3=0;
            %         end;
            %         if(num2<r3 && flag3==1)
            %            flag3=0;
            %       end
         
        end
    end
    
    val=get(handles.popupmenu1,'Value');
    if n2==1
        if(val==1)
        elseif(val==2) 
            ss=size(Ttim1ax1,2);
            axes(handles.axes1);
            plot(Ttim1ax1,Thumidity1(1:ss,1),'linewidth',3);
            ylim([0 60]);
            title('Real time Humidity Data');
            ylabel('Humidity');
            xlabel('Time');
            datetick('x','HH:MM:SS','keepticks');
            pause(0.1);
        elseif(val==3)
            ss=size(Ttim2ax2,2);
            axes(handles.axes2);
            plot(Ttim2ax2,TTemperature1(1:ss,1),'linewidth',3);  
            ylim([0 50]);
            title('Real time Temperature Data');
            ylabel('Temp');
            xlabel('Time');
            datetick('x','HH:MM:SS','keepticks');
            pause(0.1);
        elseif(val==4)
            ss=size(Ttim3ax3,2);
            axes(handles.axes3);
            plot(Ttim3ax3,TMoisture1(1:ss,1),'linewidth',3);   
            title('Real time Soil Moisture Data');
            ylabel('Moisture');
            xlabel('Time');
            ylim([0 2000]);
            datetick('x','HH:MM:SS','keepticks');
            pause(0.1);
        elseif(val==5)
            ss=size(Ttim4ax4,2); 
            axes(handles.axes4);
            plot(Ttim4ax4,TPressure1(1:ss,1),'linewidth',3);  
            title('Real time Pressue Data');
            ylabel('Pressure');
            xlabel('Time');
            ylim([0 2000]);
            datetick('x','HH:MM:SS','keepticks');
            pause(0.1);     
        end
    end
    
    % curs = exec(connec1,'select * from sensor1');
    % curs = fetch(curs);
    % curs.Data;
    colnames = {'Humidity','Temperature','Moisture','Date'};
    % if isempty(humidity1)
    %    humidity1(end)=10; 
    % end
    % ss = ss+1;
    % data = {humidity1(end) Temperature1(end) Moisture1(end) datestr(now,'mmmm dd, yyyy HH:MM:SS AM')};
    % tablename = 'sensor1';
    % datainsert(connec1,tablename,colnames,data);
end
end
guidata(hObject, handles);




function  send(obj,event,handles)
global ser
disp('HELLO');
d=fscanf(handles.gsm,'%s');
disp(d);
x=find(d=='@');
    set(handles.edit17,'string',d(x:x+2));
    fprintf(ser,'%s',d(x:x+2));
 flushinput(handles.gsm);
   flushoutput(handles.gsm);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ser ser_gsm;
fclose(ser);
delete(ser);
clear ser;
fclose(ser_gsm);
delete(ser_gsm);
clear ser_gsm;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
cla(handles.axes2);
cla(handles.axes3);
set(handles.edit1,'string',' ');
set(handles.edit2,'string',' ');
set(handles.edit3,'string',' ');
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global val humidity1 Temperature1 Moisture1 ax ax1 ax2



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
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
global n1 n2
n1=get(handles.radiobutton1,'value');
if n1==1
    set(handles.radiobutton2,'value',0);
    n2=0;
    cla(handles.axes1);
    cla(handles.axes2);
    cla(handles.axes3);
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global n1 n2
n2=get(handles.radiobutton2,'value');
if n2==1
    set(handles.radiobutton1,'value',0);
    n1=0;
    cla(handles.axes1);
    cla(handles.axes2);
    cla(handles.axes3);
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

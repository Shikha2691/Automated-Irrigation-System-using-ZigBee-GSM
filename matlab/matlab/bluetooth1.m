instrreset;
global ser;
% ser = Bluetooth('H-C-2010-06-01',1);
ser = serial('COM8');
% fopen(ser);
        
%  ser.BytesAvailableFcnMode='byte';    %event is genertaed when no of bytes given in fuctioncont are received
ser.Timeout=0.5;    %timeout after 1 sec
% ser.BytesAvailableFcnCount=1;    %wait for one byte before generating event
        flushinput(ser);
        flushoutput(ser);
% 
ser.BytesAvailableFcnMode = 'terminator';
ser.BytesAvailableFcn = {@send};    
fopen(ser)
set(ser,'Terminator',{'#' '#'});
disp('connected');
warning('off');
while(1)
     
    disp('hello');
     
     pause(4);
end


% function send(obj,event)
% global ser
% d=fscanf(ser,'%c');
% disp(d);
% end



% ser=serial(upper(com_sel),'baudrate',9600);
%         handles.ser.BytesAvailableFcnMode='byte';
%          handles.ser.Timeout=1;
%          handles.ser.BytesAvailableFcnCount=4;
%         flushinput(handles.ser);
%         flushoutput(handles.ser);
%         handles.ser.BytesAvailableFcn={@send,handles};
       




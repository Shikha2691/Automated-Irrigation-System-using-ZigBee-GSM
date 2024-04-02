function send(obj,event)
global ser
d=fscanf(ser,'%s');
disp(d);
x=find(d=='@');
received_byte=d(x+2);
disp(received_byte);
if(received_byte=='A')
    disp('device 1 off')
elseif(received_byte=='B')
    disp('device 2 off')
end 
 flushinput(ser);
   flushoutput(ser);
end


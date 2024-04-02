function send_message(ser,data)
	
    set(ser,'Terminator',{'CR/LF' 'CR/LF' });
    fprintf(ser,'%s','\n\rATE0\n\r')
 	pause(0.2);
	fprintf(ser,'%s','\n\rAT+CMGF=1\n\r')
 	pause(0.2);
    fprintf(ser,'%s','\n\rAT+CMGS="9582860506"') % change mobile number
      fprintf(ser,'%s','\n')
 	  pause(0.2);
      fprintf(ser,'%s',data);
       d = hex2dec('1A');
      pause(0.2);
 	  fprintf(ser,'%c',d);
      
     set(ser,'Terminator',{'#' '#'});


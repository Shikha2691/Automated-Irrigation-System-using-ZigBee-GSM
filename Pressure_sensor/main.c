#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define F_CPU 8000000UL
#include <util/delay.h>
#include <math.h>
#define UART_BAUD_RATE 2400
#include "uart.h"

#include "bmp085.h"

void ser_tx(unsigned char ch)
{
	UDR=ch;
	while((UCSRA&(1<<UDRE))==0);
}

unsigned char ser_rx()
{
	unsigned char R;
	while((UCSRA&(1<<RXC))==0);
	R=UDR;
	return R;
}

void serial_string(char *ch)
{
	while(*ch!='\0')
	ser_tx(*ch++);
}






int main(void) {
	long l;
	double d;
	char printbuff[10];

	//init uart
	//uart_init( UART_BAUD_SELECT(UART_BAUD_RATE,F_CPU) );

	UBRRH=0x00;
	UBRRL=207;//51;
	UCSRB=0x18;
	UCSRC=0x86;
	
	//init interrupt
	//sei();

	//init bmp085
	bmp085_init();

	//main loop
	for (;;)
	{
		//get temperature
		d = bmp085_gettemperature();
		dtostrf(d, 10, 2, printbuff);
		serial_string("temperature: "); serial_string(printbuff);  serial_string(" C deg"); serial_string("\r\n");

		//get pressure
		l = bmp085_getpressure();
		ltoa(l, printbuff, 10);
		serial_string("pressure: "); serial_string(printbuff); serial_string(" Pa"); serial_string("\r\n");

		//get altitude
		d = bmp085_getaltitude();
		dtostrf(d, 10, 2, printbuff);
		serial_string("altitude: "); serial_string(printbuff); serial_string(" M"); serial_string("\r\n");

		serial_string("\r\n");
		_delay_ms(1500);
	}
	
	return 0;
}

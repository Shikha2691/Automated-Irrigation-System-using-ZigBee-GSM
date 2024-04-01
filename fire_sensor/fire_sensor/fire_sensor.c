/* * fire_sensor.c
 *
 * Created: 3/14/2016 2:23:32 PM
 *  Author: Sikha
 */ 

#include <avr/io.h>
#define F_CPU 8000000UL
#include <util/delay.h>
#define buzzer (1<<2)
#define SW (1<<7)
#define s (PINC&SW)
void ADC_init()
{
	DDRA = 0x00;
	ADMUX = 0x40;	
	ADCSRA = (1<<7)|(1<<2);
}

int ADC_Read (int ch)
{
	int x;
	ADMUX = (0x40)|ch;
	ADCSRA |= (1<<ADSC);
	while((ADCSRA & (1<< ADIF))==0);
	x=ADC;
	//x = ADC | 0x3f;
	return (x);
}

void ser_tx(char T)
{
	UDR = T;
	while((UCSRA & (1<<UDRE))==0);
}

unsigned char ser_rx()
{
	unsigned char rec;
	while((UCSRA & (1<<RXC))==0);
	rec = UDR;
	return(rec);
}

void serial_string(char *ch)
{
	while(*ch!='\0')
	ser_tx(*ch++);
}

int main(void)
{
	//DDRC=0x00; //configuring PortC pin 0 as input
	//PORTC=0x00;
	DDRB |= buzzer;
	PORTB=0x00;
	//DDRA=0x00;
	//unsigned int t;
	UCSRB |= (1<<TXEN)|(1<<RXEN);
	UCSRC |= (1<<URSEL)|(1<<UCSZ1)|(1<<UCSZ0);
	UBRRL = 51;
	int val;
	ADC_init();
	//int result;
	
	
	while(1)
	{

		val = ADC_Read(2); 
		serial_string("sensor value:");                                                
		ser_tx((val/100)+48);
		ser_tx(((val%100)/10)+48);
		ser_tx((((val%100)%10))+48);
		////ser_tx(((((val%1000)%100)%10)/10)+48);
		serial_string("\r\n");
		_delay_ms(2000);
		
		 if(s==SW)            // check for sensor pin PC.3 using bit
		 {
			PORTB |= buzzer;
			_delay_ms(2000);
			PORTB&=~ buzzer;
			_delay_ms(2000);
		 }
		
	 }
	}





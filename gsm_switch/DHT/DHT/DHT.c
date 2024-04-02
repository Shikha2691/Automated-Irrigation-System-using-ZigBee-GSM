/*
 * DHT.c
 *
 * Created: 2/8/2016 3:03:57 PM
 *  Author: AFG
 */ 

#define F_CPU 8000000UL
//define the pin connect to the dht11 sensor
#define DHT11_PIN_NUM PINC0
#define DHT11_PIN PINC
#define DHT11_DDR DDRC
#define DHT11_PORT PORTC
#define sw (1<<0)

//time out loop number for dht11SampleData() z
#define TIME_OUT_LOOP 500

//micro
#define SETBIT(ADDRESS,BIT) (ADDRESS |= (1<<(BIT))) 
#define CLEARBIT(ADDRESS,BIT) (ADDRESS &= ~(1<<(BIT))) 
#define FLIPBIT(ADDRESS,BIT) (ADDRESS ^= (1<<(BIT))) 
#define CHECKBIT(ADDRESS,BIT) (ADDRESS & (1<<(BIT))) 
#define SETBITMASK(x,y) (x |= (y)) 
#define CLEARBITMASK(x,y) (x &= (~y)) 
#define FLIPBITMASK(x,y) (x ^= (y)) 
#define CHECKBITMASK(x,y) (x & (y)) 

#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>

// function prototype, sensor related
void dht11StartSignal(); //send start signal to dht11 sensor
bool dht11SampleData(); //sample data from dht11 sensor
bool dht11CheckAck(); //check respond after sending start signal
bool dht11SamplePin(); //read dht11 sensor output pin state
uint8_t dht11ReadOneBitData(); //read one bit data and return it
bool dht11Checksum(uint8_t data[]); //check the integrity of the data, not finished yet

void dht11InputMode(); //set the pin connect to dht11 sensor as input
void dht11OutputMode(); //set the pin connect to dht11 sensor as output
void dht11PullLow(); // pull the pin connect to dht11 low
void dht11PullHigh(); // pull the pin connect to dht11 high

// function prototype, testing related
void TestingIndicator(); //flash some LED on PORTA as signal indicator, for testing
void TestingDelay1000ms(); //delay one second

unsigned data_byte;
	uint8_t data[5];
433333
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

void ser_string(char *ch)
{
	while(*ch!='\0')
	ser_tx(*ch++);
}

void separate_byte_serial(int c,int val)
{
	//int x;
	//if (val==1)
	//{	
	////serial_string("Temperature :: ");
	//ser_tx('Tempera');ser_tx((c/10)+48);ser_tx((c%10)+48);
	//ser_string("\r\n");
	//}
	//
	//else if(val==2)
	//{
	////serial_string("Humidity :: ");
	//ser_tx('H');ser_tx((c/10)+48);ser_tx((c%10)+48);
	//ser_string("\r\n");
    //}
}
int main(void)
{
	UBRRH=0x00;
	UBRRL=51;
	UCSRB=0x18;
	UCSRC=0x86;

	while(1)
    { 
   
	dht11StartSignal(); //send start signal
	if (dht11CheckAck()) //if respond, store 5 bits data into data[]
	{
		for (data_byte=0;data_byte<5;data_byte++)
		{
			data[data_byte]=dht11ReadOneBitData();
		}
	}
	
	if (dht11Checksum(data))  // if the received data is correct, map the data to LEDs connect to PORTA
	{
		// testing code, map the data to the LEDs connect to PORTA
	
	//	DDRB = 0xff;
	
		//PORTB = ~data[2];
		separate_byte_serial(data[2],1);
		_delay_ms(2000);
		//PORTB=0xff;
		TestingDelay1000ms();
		separate_byte_serial(data[0],2);
		//PORTB = ~data[0];
		_delay_ms(2000);
		//PORTB=0xff;
		TestingDelay1000ms();
	 
	
		
}
 if((PINB&sw)==0)
	{
	  send_message();
		//end of testing code
	}
	}
}	

uint8_t dht11ReadOneBitData()
{
	unsigned int data_bit;
	uint8_t data=0;
	
	for (data_bit=8;data_bit>0;(data_bit)--) //read 8 bit of data, the sensor send MSB first
	{
		if(dht11SampleData()) 
		{
			SETBIT (data,(data_bit)-1);
		}
		else
		{
			CLEARBIT (data,(data_bit)-1);
		}
	}
	
	return data;
	
}

bool dht11SampleData() 
{
	uint16_t loopCnt;
	loopCnt=TIME_OUT_LOOP;
	
	while(!dht11SamplePin())  //wait for the first 50us while the pin is low
	{
		loopCnt--;
		if (loopCnt==0) return false; //time out
	}
	
	_delay_us(45); //delay 45us
	
	if (dht11SamplePin())
	{	
		while(dht11SamplePin());
		return true;
	}	
	else return false;
		
}

bool dht11SamplePin()  //read pin's state , the pin that connect to the sensor
{
	if (CHECKBIT(DHT11_PIN,DHT11_PIN_NUM) == _BV(DHT11_PIN_NUM)) return true;
	else return false;
}

void dht11InputMode() //set the pin connect to the sensor as input mode
{
	CLEARBIT(DHT11_DDR,DHT11_PIN_NUM);
}

void dht11OutputMode() //set the pin connect to the sensor as output mode
{
	SETBIT(DHT11_DDR,DHT11_PIN_NUM);
}

void dht11PullHigh() //pull the pin connect to the sensor high
{
	SETBIT(DHT11_PORT,DHT11_PIN_NUM);
}

void dht11PullLow() //pull the pin connect to the sensor low
{
	CLEARBIT(DHT11_PORT,DHT11_PIN_NUM);
}

void dht11StartSignal() //send start signal to dht11 sensor
{	
	dht11OutputMode();
	dht11PullLow(); //set dht11_pin LOW for at least 18ms, refer to dht11 data sheet
	_delay_ms(18);
	dht11PullHigh(); //set dht11_pin HIGH for 20-40us, refer to dht11 data sheet
	_delay_us(40);
	dht11InputMode(); //set dht11_pin as input, release the pin, wait for respond
}

bool dht11CheckAck() //check respond after sending start signal
{	
	uint16_t loopCnt;
	loopCnt=TIME_OUT_LOOP;
	
	while(!dht11SamplePin()) //wait while the pin is low, no 80us checking preformed
	{
		loopCnt--;
		if (loopCnt==0) return false; // return false if time out
	}
	
	loopCnt=TIME_OUT_LOOP;
	while(dht11SamplePin()) //wait while the pin is high, no 80us checking preformed
	{
		loopCnt--;
		if (loopCnt==0) return false; // return false if time out
	}
	
	return true;
}

// check if receive the correct data, details refer to the data sheet
bool  dht11Checksum(uint8_t data[]) 
{
	int bit_num;
	uint8_t checksum=0;
	
	for(bit_num=0;bit_num<4;bit_num++)
	{
		checksum=checksum+data[bit_num];
	}
	
	if (checksum==data[4]) return true;
	else return false;
}

//void TestingIndicator() //flash all the LED connected to PORTB twice
//{
	//DDRB=0xff;
	//PORTB=0x00; //LEDs are active LOW
	//TestingDelay1000ms();
	//PORTB=0xff;
	//TestingDelay1000ms();
	//PORTB=0x00;
	//TestingDelay1000ms();
	//PORTB=0xff;
//}

void TestingDelay1000ms() //delay 500ms
{
	_delay_ms(500);
}

void send_message()
{
	ser_string("\r\nAT\r\n");
	_delay_ms(500);
	//ser_string("\r\nATE0\r\n");
	//_delay_ms(500);
	ser_string("\r\nAT+CMGF=1\r\n");
	_delay_ms(500);
	ser_string("\r\nAT+CMGS=\"8586825196\"");
	_delay_ms(500);
	
	  ser_tx('\r');
	  _delay_ms(400);
	//  ser_string("ILLEGAL ATTEMPT TO ACCESS YOUR SYSTEM. KINDLY PAY ATTENTION");
	  ser_tx('T');
	  ser_tx((data[2]/10)+48);
	  ser_tx((data[2]%10)+48);
	  ser_tx('H');
	  ser_tx((data[0]/10)+48);
	  ser_tx((data[0]%10)+48);
	  
	  _delay_ms(500);
	  
	  ser_tx(0x1A);
}

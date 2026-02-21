/////////////////////////////////////////////
//
//		François-Gabriel Sourbé
//		Maroua Qidi
//		1G2 TD3 TP6
//
//		Microprocesseurs
//		TP2&3 BARE METAL
//
/////////////////////////////////////////////

#include <stm32l4xx_hal.h>
#include "utils.h"
#include "LED.h"

int GreenLED_state;
int wait_time;

void UTILS_WaitN10ms(int N){
	int n,i,s=0;
	for(n=1;n<=N;n++){
		for(i=0;i<100000;i++){
			s=s+i;
		}
	}
}

#include "button.h"

void setup(void){
	LED_Config();
	GreenLED_state=1;
	wait_time=50;
	//Q15
	BUTTON_Enable();
	BUTTON_Config();
}

void loop(void){
	if(BUTTON_GetBlueLevel()==GPIO_PIN_RESET){
		if(wait_time==50){
			wait_time=10;
		}
		else{
			wait_time=50;
		}
	}
	LED_DriveGreen(GreenLED_state);
	GreenLED_state=1-GreenLED_state;
	UTILS_WaitN10ms(wait_time);
}

void button_test(){
	if(BUTTON_GetBlueLevel()==GPIO_PIN_RESET){
		wait_time=50;
	}
	else{
		wait_time=100;
	}
}




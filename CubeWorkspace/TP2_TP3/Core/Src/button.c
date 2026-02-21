/////////////////////////////////////////////
//
//		François-Gabriel Sourbé
//		Maroua Qidi
//		1G2 TD3 TP6
//
//		Microprocesseurs
//		TP3 BARE METAL
//
/////////////////////////////////////////////


#include "button.h"

void BUTTON_Enable(){
	int* RCC_AHB2ENR = (int*)0x4002104C; // typage forcé pour éviter un warning
	// On met dans un pointeur l'adresse du registre qu'on souhaite modifier
	*RCC_AHB2ENR |= (1<<2);
	// On met à 1 le 3e bit du contenu pointé grâce à un OU bit à bit
}



#include <stm32l4xx.h>

void BUTTON_Config(){
	GPIOC->MODER &= ~(3<<26);
	// On écrit 3 (soit 11 en binaire) et on le décale de 26 bits avec <<
	// Puis on inverse avec ~
	// Donc les bits 26 et 27 sont à 0 et les autres à 1
}




#include <stm32l4xx_hal.h>

int BUTTON_GetBlueLevel(){
	return HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_13);
}




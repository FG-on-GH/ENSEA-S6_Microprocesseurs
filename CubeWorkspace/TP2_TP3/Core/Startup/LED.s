////////////////////////////////////////////
//
//		François-Gabriel Sourbé
//		Maroua Qidi
//		1G2 TD3 TP6
//
//		Microprocesseurs
//		TP2 BARE METAL
//
////////////////////////////////////////////
// COMMON DIRECTIVES to Use ASM Language
  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb

///////////////////////////////

	.global LED_Enable  // Rend la fonction visible pour le linker
	.text               // Section de code

LED_Enable:
    PUSH {R4,LR}       // Sauvegarde du contexte pour assurer la transparence
    LDR R4, =0x4002104C // Charge l'adresse du registre RCC_AHB2ENR dans R1
    LDR R0, [R4]        // Charge la valeur à l'adresse contenue dans R1 vers R0
    ORR R0, R0, #1      // R0 = R0 OR 1. Met le premier bit à 1 sans toucher aux autres
    STR R0, [R4]        // Stocke le contenu de R0 à l'adresse contenue dans R1
    POP {R4,PC}        // Restauration et retour

///////////////////////////////

	.global LED_Config
	.text

LED_Config:
	PUSH {R4,R5,LR}
	BL LED_Enable		// On s'assure que GPIOA est activé
						// pour pouvoir faire les modifications
	LDR R4, =0x48000000
    LDR R0, [R4]
    ORR R0, R0, #1024   // Met le bit 10 à 1 sans toucher aux autres
    					// 1024 = 2^10 -> tous les bits à 0 sauf le 10
   	LDR R5, =0xFFFFF7FF	// On ne pourra pas faire AND avec un élément de
   						// 32 bits donc on le charge dans un registre
   						// 0x7FF = 0111 1111 1111 -> seul le bit 11 est à 0
    AND R0, R0, R5		// R0 = R0 AND R2. Met le bit 11 à 0
    STR R0, [R4]
    POP {R4,R5,PC}

///////////////////////////////

	.global LED_DriveGreen
	.text

LED_DriveGreen:
	PUSH {R4,R5,LR}
	AND R0, #1
	CMP R0, #1
	BEQ LED_On
LED_Off:				// L'étiquette n'a pas d'autre utilité que la clartée de lecture
	LDR R4, =0x48000014
    LDR R0, [R1]
    LDR R5, =0xFFFFFFDF
    AND R0, R0, R5
    STR R0, [R4]
	POP {R4,R5,PC}

///////////////////////////////

	.global LED_On
	.text

LED_On:
	LDR R4, =0x48000014
    LDR R0, [R4]
    ORR R0, R0, #32
    STR R0, [R4]
    POP {R4,R5,PC}

///////////////////////////////







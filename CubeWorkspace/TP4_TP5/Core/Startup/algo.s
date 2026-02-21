/////////////////////////////////////////////
//
//		François-Gabriel Sourbé
//		Maroua Qidi
//		1G2 TD3 TP6
//
//		Microprocesseurs
//		TP4 CPU PERFORMANCE
//
/////////////////////////////////////////////
// COMMON DIRECTIVES to Use ASM Language
  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb

///////////////////////////////

	.global myTimeEvaluationFunction
	.text

myTimeEvaluationFunction:
	// Argument : int N, sauvegardé dans R0
	PUSH {R4,R5}		// On sauvegarde le contexte pour la transparence
    MOV R4, #0			// Initialisation d'une varaiable qui nous servira dans la boucle
    MOV R5, #0			// Compteur de la boucle
	CMP R5, R0          // Compare la compteur de boucle (R5) avec N (R0)
    BGT Fin_waitN       // Si R5 > N, on passe directement à la fin (cas N<=0)

Boucle_waitN:
    ADD R4, R4, #0		// Instruction simple à répéter
    ADD R5, R5, #1      // Incrémantation du compteur de boucle
    CMP R5, R0          // Test pour sortir
    BLE Boucle_waitN    // Si n <= N, on recommence

Fin_waitN:
	POP {R4,R5}
    BX LR

///////////////////////////////





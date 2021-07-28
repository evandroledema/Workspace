	PROCESSOR 16F877A
	
	#include <xc.inc>             ;library pics
	#include "pic16f877a.inc"     ;specific pic
	
	; CONFIG ==================== ; Configuration Bits H'3FFF'
	CONFIG  FOSC = HS             ; Oscillator Selection bits (HS oscillator)
	CONFIG  WDTE = OFF            ; Watchdog Timer Enable bit (WDT disabled)
	CONFIG  PWRTE = ON            ; Power-up Timer Enable bit (PWRT enabled)
	CONFIG  BOREN = OFF           ; Brown-out Reset Enable bit (BOR disabled)
	CONFIG  LVP = OFF             ; Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
	CONFIG  CPD = ON              ; Data EEPROM Memory Code Protection bit (Data EEPROM code-protected)
	CONFIG  WRT = HALF            ; Flash Program Memory Write Enable bits (0000h to 0FFFh write-protected; 1000h to 1FFFh may be written to by EECON control)
	CONFIG  CP = ON               ; Flash Program Memory Code Protection bit (All program memory code-protected)
	; ========================================	
;===========================================================================
;PSECT Code,class=CODE,reloc=2,delta=2 ;to stop phase error
;   Verify the address in the Program Memory Map section of the DataSheet
;   Specify psect  position for linker
;   Enter in the Linker: -Pres_vect=0h
;	iInstruction opcodes are 14 bits wide on this baseline device
;	delta=2 flag indicates that 2bytes reside at each address in memory
PSECT res_vect, class=CODE, delta=2 ; reset vector 0000h

;=============================================================================
;Data words on this device are 8 bits. Any PSECT for data should therefore
;omit the delta flag or explicitly set this flat (delta=1).
    ; To do: add a data psect?
;=============================================================================
;Enter in the Linker: -Pint_vect=4h
;PSECT int_vect, class=CODE, delta=2 ; interup vector 0004h
;=============================================================================
    
;Endereços de RAM utilizados para atribuições de variáveis
Estado	equ	0x03
porta_A equ	0x05
porta_B equ	0x06
porta_D equ	0x08
tris_A  equ	0x85
tris_D  equ	0x88
ADCON1  equ	0x9F

;Definição de endereço inicial do programa
	org	0x00			; Vetor de Reset
PSECT code
 
;Configurações iniciais
setup:
	clrf	porta_A		; PORTC <- 0x00
	clrf	porta_D		; PORTD <- 0x00
	bsf	Estado, 5	; STATUS<5> = 1, seleciona o banco 1
	movlw	0x06
	movwf	ADCON1		; define PORTA e PORTE como e/S digitais
	movlw	0xF0		; Wreg <-- 0xF0
	movwf	tris_A		; apenas os bits Porta_A<3:0> definidos como saídas 
	clrf	tris_D		; PORTD é definida como saída 
	bcf	Estado, 5	; STATUS<5> = 0, seleciona o banco 0

main:

testa_botao:
	btfsc	porta_B, 0	; pula se botao0 não está presionado
	goto	botao0_p	; salta se botao0 não está presionado

	btfss	porta_B, 1	; pula se botao1 está presionado
	goto	testa_botao	; salta e testa de novo se botao1 não está presionado

botao1_p:
	btfsc	porta_B, 1	; pula se botao1 foi solto
	goto	botao1_p	; espera se ainda não foi solto

	decf	porta_D, F	; decrementa o valor da Porta_D (LED)
	goto	testa_botao	; retorna a testar botões

botao0_p:
	btfsc	porta_B, 0	; pula se botao0 foi solto
	goto	botao0_p	; espera se ainda não foi solto

	incf	porta_D, F	; incrementa o valor da Porta_D (LEDs)
	goto	testa_botao	; retorna a testar botões

	END			; FIM DE PROGRAMA

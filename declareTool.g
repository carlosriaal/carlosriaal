; Declare tool
; called in loadConfig.g for each printhead detected in the docks

; param.A ; Name of the printheads 
; param.B ; Driver (0,1 or 2), same as tool N
; param.C ; Heater 
; param.D ; Fan
; param.H ; Can address
; ################################## TOOL DECLARATION ##################################
; P -> tool N
; S -> tool name
; D -> extruder driver 0, 1 or 2
; H -> heater 

if param.C != -1 ; if no heater
	M563 P{param.B} S{param.A} D{param.B} H{param.C} F{param.D}
else
	M563 P{param.B} S{param.A} D{param.B} F{param.D}

;Set standby and active temperatures
G10 P{param.B} R0 S0 

; ################################ EXTRA FEATURES OF THE TOOLS ################################
; End of syringe sensor
if param.H = 20
	M591 D{param.B} P1 C"20.io0.in" S1 ; filament monitor for GEL printhead, enable to call filament-error.g when pin detected
; Vibrators and solenoids micro pellets
elif param.H = 21
	M950 P4 C"21.out1"	;pin vibrador ID21
	M950 P5 C"21.out0"	;pin solenoide ID21
elif param.H = 22
	M950 P2 C"22.out1"	;pin vibrador ID22
	M950 P3 C"22.out0"	;pin solenoide ID22
; called by M42 Px Sx  (P gpio pin number, S value PWM 1=100% 0=0%) - usar temporizado solo pocos segundos!





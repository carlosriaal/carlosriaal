; executed on start-up
;

;################################ GENERAL SETTINGS ################################
M98 P"globalVariables.g" 
M586 P0 S1              ; enable HTTP
M586 P1 S1              ; enable FTP
M586 P2 S1              ; enable Telnet

G90                     ; send absolute coordinates...
M83                     ; ...but relative extruder moves

M550 P"Medimaker2"      ; set printer name
G4 S2                ; wait for expansion boards to start
M669 K0 S300            ; cartesian kinematics and segments per second

; ############################## LOAD CONFIG ##############################
M98 P"loadConfig.g"

;################################# Z PROBE 0 CONFIG #################################
M950 S0 C"out4"                      	    ; create servo pin 0 for solenoid on Out4
M558 P8 C"!io3.in" A1 H12 R0.5 F800 T4000      ; set Z probe type and the dive height + speeds
G31 X0 Y0 Z0                 	    	    ; set Z probe trigger value, offset and trigger height

;################################ TOOL Z PROBE CONFIG ################################
; Tool offset pin declaration here
; This probe will measure each tool offset
M558 K1 P8 C"io1.in" H20 F600 T2000; declare probe 1 as type 8
G31 K1 P1000 X-1.3 Y106.6 Z0 ; When probe 1 value = 1000, actual position as X0, Y-120, Z0

; #################################### MESH GRID ####################################
M557 X-100:100 Y-60:60 P5:5	 ; define mesh grid

;M84 S30 ; Disable motor idle current reduction

;################################## AXIS LIMITS ##################################
M208 X-200:200 Y-64:125 Z0:100 U0:100 V0:100 ; set axis minima and maxima
; FIX X and Y limits
; When no tool: X{limX,limX2} Y{limY,limY2}

;################################# AXIS ENDSTOPS #################################
M574 X1 S1 P"!40.io0.in" ; configure active-high endstop for low end on X via pin 40.io0.in
M574 Y1 S1 P"!41.io0.in" ; configure active-high endstop for low end on Y via pin 41.io0.in
M574 Z2 S1 P"!43.io0.in"
M574 U2 S1 P"!44.io0.in" ; configure active-high endstop for high end on U via pin 44.io0.in
M574 V2 S1 P"!45.io0.in" ; configure active-high endstop for high end on V via pin 45.io0.in

;######################### PRINTER HEATERS DECLARATIONS #########################
; Tool heaters already declared at loadConfig.g

; Bed heater
;M308 S0 P"temp1" Y"thermistor" T100000 B4725 C7.06e-8 ; configure sensor param.A as thermistor on pin {param.B}.temp0
;M950 H0 C"out1" T0 ; create nozzle heater output on .out and map it to sensor 2
;M307 H0 B0 R0.419 C401.2 D2.65 S1.00 V0 ; disable bang-bang mode for heater  and set PWM limit
;M140 H0
;M143 H0 S100

; Syringe preheater
M308 S1 P"temp0" Y"thermistor" T100000 B4725 C7.06e-8 ; configure sensor param.A as thermistor on pin {param.B}.temp0
M950 H1 C"out0" T1 ; create nozzle heater output on .out and map it to sensor 2
M307 H1 R0.268 K0.116:0.000 D4.11 E1.35 S1.00 B0 ; disable bang-bang mode for heater  and set PWM limit
M141 H1
M143 H1 S130

;########################## PRINTER FANS DECLARATIONS ##########################
; No fans

;Emergency reset switch
M950 J1 C"io0.in"
M581 P1 T0 C0

T-1 P0; Unselect tool

echo "PRINTER READY, TRY HOMING ALL"


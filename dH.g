; Heater definition
; param.A -> Id ; param.B -> pin .temp ; param.C -> R ; param.D -> E ; param.E -> D   
; param.F -> S ; param.J -> V ; param.H -> Max temp ; param.I -> pin .out; param.K -> K0; param.L -> K1

if param.A != -1
	M308 S{param.A} P{param.B} Y"thermistor" T100000 B4725 C7.06e-8 ; configure sensor param.A as thermistor on pin {param.B}.temp0
	M950 H{param.A} C{param.I} T{param.A} ; create nozzle heater output on .out and map it to sensor 2
	;M307 H{param.A} B0 R{param.C} C{param.D} D{param.E} S{param.F} V{param.J} ; disable bang-bang mode for heater and set PWM limit
	
	M307 H{param.A} B0 R{param.C} D{param.E} S{param.F} V{param.J} K{param.K,param.L} E{param.D}
	
	
	M143 H{param.A} S{param.H} ; set max heater temperature
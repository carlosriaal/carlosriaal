; ################################ VARIABLE DECLARATIONS ################################

var nPrintheads = 6

; current printhead variables
var currentDriver=-1
var currentDriverF=-1.0
var currentStepsPerMm=-1
var currentToolName=""
var currentXoffset=-1
var currentYoffset=-1
var currentHeaterId=-1
var currentHeaterR=-1
var currentHeaterE=-1
var currentHeaterKInit=-1
var currentHeaterKEnd=-1
var currentHeaterD=-1
var currentHeaterS=-1
var currentHeaterV=-1
var currentHeaterMaxTemp=-1

; driver zero variables
var driverZero=-1 ; E0 physical driver if connected
var driverZeroF=-1.0
var driverZeroStepsPerMm=-1
var driverZeroToolName=""
var driverZeroXOffset=-1
var driverZeroYOffset=-1
var dZHR=-1
var dZHId=-1
var dZHE=-1
var dZHKInit=-1
var dZHKEnd=-1
var dZHD=-1 
var dZHS=-1 
var dZHV=-1 
var dZHMT=-1

; driver one variables
var driverOne=-1 ; E1 physical driver if connected
var driverOneF=-1.0
var driverOneStepsPerMm=-1
var driverOneToolName=""
var driverOneXOffset=-1
var driverOneYOffset=-1
var dOHR=-1
var dOHId=-1
var dOHE=-1
var dOHKInit=-1
var dOHKEnd=-1
var dOHD=-1 
var dOHS=-1 
var dOHV=-1 
var dOHMT=-1

; driver two variables
var driverTwo=-1 ; E2 physical driver if connected
var driverTwoF=-1.0
var driverTwoStepsPerMm=-1 
var driverTwoToolName=""
var driverTwoXOffset=-1
var driverTwoYOffset=-1
var dTHR=-1
var dTHId=-1
var dTHE=-1
var dTHKInit=-1
var dTHKEnd=-1
var dTHD=-1 
var dTHS=-1 
var dTHV=-1 
var dTHMT=-1

var switchDock = 0;
var flag = 1;


while iterations < var.nPrintheads
	; ############# PRINTHEAD DRIVERS, SWITCHES AND HEATERS DECLARATIONS ################
	; ####################################### SSE #######################################
	if iterations = 0
		; Driver definition
		;M569 P20.0 S1 ; physical drive 20 goes forwards
		; Switches definitions for dock detection
		if boards[1].canAddress = 20 || boards[2].canAddress = 20 || boards[3].canAddress = 20
		  M569 P20.0 S0 ; physical drive 20 goes forwards
		  M950 J{var.switchDock + 1} C"!20.io1.in"   ; define left switch
		  M950 J{var.switchDock + 2} C"!20.io2.in"   ; define right switch
		  set var.switchDock = var.switchDock + 2;
		  set var.flag = 0;
		; Set current variables
		set var.currentToolName="SSE" ; Printhead name
		set var.currentDriver=20 ; Printhead can bus value
		set var.currentDriverF=20.0
		set var.currentStepsPerMm=42.00 ; Printhead steps per mm
		;Set offset values
		set var.currentXoffset=39.88 ; Printhead X offset related to dock center point
		set var.currentYoffset=72.94 ; Printhead Y offset related to dock center point
		;Set heater variables
		set var.currentHeaterId=2
		set var.currentHeaterR=0.654
		set var.currentHeaterE=1.35
		set var.currentHeaterKInit=0.810
		set var.currentHeaterKEnd=0.000
		set var.currentHeaterD=4.52
		set var.currentHeaterS=1.00
		set var.currentHeaterV=24.2
		set var.currentHeaterMaxTemp=140
	; ####################################### PELLETS1 #######################################
	elif iterations = 1
		; Driver definitions
		;M569 P21.0 S1 ; physical drive 21 goes forwards
		; Switches definitions for dock detection
		if boards[1].canAddress = 21 || boards[2].canAddress = 21 || boards[3].canAddress = 21
		  M569 P21.0 S1 ; physical drive 21 goes forwards
		  M950 J{var.switchDock + 1} C"!21.io1.in"   ; define left switch
		  M950 J{var.switchDock + 2} C"!21.io2.in"   ; define right switch
		  set var.switchDock = var.switchDock + 2;
		  set var.flag = 0
		; Set current variables
		set var.currentToolName="PELLETS1" ; Printhead name
		set var.currentDriver=21 ; Printhead can bus value
		set var.currentDriverF=21.0
		set var.currentStepsPerMm=42.00 ; Printhead steps per mm
		;Set offset values
		set var.currentXoffset=46.83 ; Printhead X offset related to dock center point
		set var.currentYoffset=76.69 ; Printhead Y offset related to dock center point
		;Set heater variables
		set var.currentHeaterId=-1

	; ###################################### PELLETS2 ######################################
	elif iterations = 2
		; Driver definitions
		;M569 P22.0 S1 ; physical drive 22 goes forwards
		; Switches definitions for dock detection
		if boards[1].canAddress = 22 || boards[2].canAddress = 22 || boards[3].canAddress = 22
		  M569 P22.0 S1 ; physical drive 22 goes forwards
		  M950 J{var.switchDock + 1} C"!22.io1.in"   ; define left switch
		  M950 J{var.switchDock + 2} C"!22.io2.in"   ; define right switch
		  set var.switchDock = var.switchDock + 2;
		  set var.flag = 0;
		; Set current variables
		set var.currentToolName="PELLETS2" ; Printhead name
		set var.currentDriver=22 ; Printhead can bus value
		set var.currentDriverF=22.0
		set var.currentStepsPerMm=420.00 ; Printhead steps per mm
		;Set offset values
		set var.currentXoffset=46.75 ; Printhead X offset related to dock center point
		set var.currentYoffset=76.74 ; Printhead Y offset related to dock center point
		;Set heater variables
		set var.currentHeaterId=-1
	; ###################################### SSE-2 ######################################
	elif iterations = 3
		; Driver definition
		;M569 P23.0 S1 ; physical drive 20 goes forwards
		; Switches definitions for dock detection
		if boards[1].canAddress = 23 || boards[2].canAddress = 23 || boards[3].canAddress = 23
		  M569 P23.0 S0 ; physical drive 20 goes forwards
		  M950 J{var.switchDock + 1} C"!23.io1.in"   ; define left switch
		  M950 J{var.switchDock + 2} C"!23.io2.in"   ; define right switch
		  set var.switchDock = var.switchDock + 2;
		  set var.flag = 0;
		; Set current variables
		set var.currentToolName="SSE-2" ; Printhead name
		set var.currentDriver=23 ; Printhead can bus value
		set var.currentDriverF=23.0
		set var.currentStepsPerMm=42.00 ; Printhead steps per mm
		;Set offset values
               set var.currentXoffset=41.38
               set var.currentYoffset=73.34
		;Set heater variables
		set var.currentHeaterId=3
		set var.currentHeaterR=0.542
		set var.currentHeaterE=1.35
		set var.currentHeaterKInit=0.481
		set var.currentHeaterKEnd=0.000
		set var.currentHeaterD=3.87
		set var.currentHeaterS=1.00
		set var.currentHeaterV=24.4
		set var.currentHeaterMaxTemp=140
	; ###################################### FDM ######################################
	elif iterations = 4
		; Driver definition
		;M569 P24.0 S1 ; physical drive 20 goes forwards
		; Switches definitions for dock detection
		if boards[1].canAddress = 24 || boards[2].canAddress = 24 || boards[3].canAddress = 24
		  M569 P24.0 S1 ; physical drive 20 goes forwards
		  M950 J{var.switchDock + 1} C"!24.io1.in"   ; define left switch
		  M950 J{var.switchDock + 2} C"!24.io2.in"   ; define right switch
		  set var.switchDock = var.switchDock + 2;
		  set var.flag = 0;
		; Set current variables
		set var.currentToolName="FDM" ; Printhead name
		set var.currentDriver=24 ; Printhead can bus value
		set var.currentDriverF=24.0
		set var.currentStepsPerMm=395.00 ; Printhead steps per mm
		;Set offset values
               set var.currentXoffset=52.25
               set var.currentYoffset=56.35
		;Set heater variables
		set var.currentHeaterId=4
		set var.currentHeaterR=2.120
		set var.currentHeaterE=1.35
		set var.currentHeaterKInit=0.332
		set var.currentHeaterKEnd=0.024
		set var.currentHeaterD=5.14
		set var.currentHeaterS=1.00
		set var.currentHeaterV=24.2
		set var.currentHeaterMaxTemp=280
	; ###################################### FDM-2 ######################################
	elif iterations = 5
		; Driver definition
		;M569 P25.0 S1 ; physical drive 20 goes forwards
		; Switches definitions for dock detection
		if boards[1].canAddress = 25 || boards[2].canAddress = 25 || boards[3].canAddress = 25
		  M569 P25.0 S1 ; physical drive 20 goes forwards
		  M950 J{var.switchDock + 1} C"!25.io1.in"   ; define left switch
		  M950 J{var.switchDock + 2} C"!25.io2.in"   ; define right switch
		  set var.switchDock = var.switchDock + 2;
		  set var.flag = 0;
		; Set current variables
		set var.currentToolName="FDM-2" ; Printhead name
		set var.currentDriver=25 ; Printhead can bus value
		set var.currentDriverF=25.0
		set var.currentStepsPerMm=395.00 ; Printhead steps per mm
		;Set offset values
               set var.currentXoffset=52.2
               set var.currentYoffset=57.2
		;Set heater variables
		set var.currentHeaterId=5
		set var.currentHeaterR=2.149
		set var.currentHeaterE=1.35
		set var.currentHeaterKInit=0.359
		set var.currentHeaterKEnd=0.003
		set var.currentHeaterD=5.64
		set var.currentHeaterS=1.00
		set var.currentHeaterV=24.2
		set var.currentHeaterMaxTemp=280
	; Copy the structure from printheadTemplate.txt "
	; ################################### PIN DETECTION ##################################
	if !exists(sensors.gpIn[{var.switchDock-1}]) || !exists(sensors.gpIn[{var.switchDock}]) || var.flag = 1
		echo ""
	elif sensors.gpIn[{var.switchDock-1}].value = 1 || sensors.gpIn[{var.switchDock}].value = 1
		set var.flag = 1
		; if 1-1 -> Dock 0
		if sensors.gpIn[{var.switchDock-1}].value = 1 && sensors.gpIn[{var.switchDock}].value = 1
			set var.driverZero = var.currentDriver
			set var.driverZeroF = var.currentDriverF
			set var.driverZeroStepsPerMm = var.currentStepsPerMm
			set var.driverZeroToolName= var.currentToolName
			set var.driverZeroXOffset= var.currentXoffset
			set var.driverZeroYOffset= var.currentYoffset
			set var.dZHR= var.currentHeaterR
			set var.dZHId=var.currentHeaterId
			set var.dZHE=var.currentHeaterE
			set var.dZHKInit=var.currentHeaterKInit
			set var.dZHKEnd=var.currentHeaterKEnd
			set var.dZHD= var.currentHeaterD 
			set var.dZHS= var.currentHeaterS 
			set var.dZHV= var.currentHeaterV 
			set var.dZHMT= var.currentHeaterMaxTemp
			set global.tool0XOffset = var.currentXoffset;
			set global.tool0YOffset = var.currentYoffset;
		; if 0-1 -> Dock 1
		elif sensors.gpIn[{var.switchDock-1}].value = 0 && sensors.gpIn[{var.switchDock}].value = 1
			set var.driverOne = var.currentDriver
			set var.driverOneF = var.currentDriverF
			set var.driverOneStepsPerMm = var.currentStepsPerMm
			set var.driverOneToolName= var.currentToolName
			set var.driverOneXOffset= var.currentXoffset
			set var.driverOneYOffset= var.currentYoffset
			set var.dOHR= var.currentHeaterR
			set var.dOHId=var.currentHeaterId
			set var.dOHE=var.currentHeaterE
			set var.dOHKInit=var.currentHeaterKInit
			set var.dOHKEnd=var.currentHeaterKEnd
			set var.dOHD= var.currentHeaterD 
			set var.dOHS= var.currentHeaterS 
			set var.dOHV= var.currentHeaterV 
			set var.dOHMT= var.currentHeaterMaxTemp
			set global.tool1XOffset = var.currentXoffset;
			set global.tool1YOffset = var.currentYoffset;
		; if 1-0 -> Dock 2
		else
			set var.driverTwo = var.currentDriver
			set var.driverTwoF = var.currentDriverF
			set var.driverTwoStepsPerMm = var.currentStepsPerMm
			set var.driverTwoToolName= var.currentToolName
			set var.driverTwoXOffset= var.currentXoffset
			set var.driverTwoYOffset= var.currentYoffset
			set var.dTHR= var.currentHeaterR
			set var.dTHId=var.currentHeaterId
			set var.dTHE=var.currentHeaterE
			set var.dTHKInit=var.currentHeaterKInit
			set var.dTHKEnd=var.currentHeaterKEnd
			set var.dTHD= var.currentHeaterD 
			set var.dTHS= var.currentHeaterS 
			set var.dTHV= var.currentHeaterV 
			set var.dTHMT= var.currentHeaterMaxTemp
			set global.tool2XOffset = var.currentXoffset;
			set global.tool2YOffset = var.currentYoffset;

;######################### AXIS BOARD DRIVERS DECLARATIONS #########################
M569 P40.0 S1 ; physical drive 40 goes forwards X                           
M569 P41.0 S0 ; physical drive 41 goes forwards Y1
M569 P42.0 S0 ; physical drive 42 goes forwards Y2
M569 P43.0 S0 ; physical drive 43 goes backwards Z1 (Z)
M569 P44.0 S0 ; physical drive 44 goes backwards Z2 (U)
M569 P45.0 S0 ; physical drive 45 goes backwards Z3 (V)

; ############################## DRIVER PARAMETERS SETTINGS ##############################
M584 X40.0 Y41.0:42.0 Z43.0 U44.0 V45.0 ; axis drive mapping
M350 X1 Y1 V1 Z1 U1 V1 I1 ; configure axis microstepping with interpolation
M92 X150.53 Y150.53 Z100.12 U100.12 V100.12 ; axis steps per mm
M566 X900.00 Y900.00 Z500.00 U500.0 V500.0 ; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z12000.00 U12000.00 V12000.00 ; set maximum speeds (mm/min)
M201 X300.00 Y300.00 Z500.00 U500.00 V500.00 ; set accelerations (mm/s^2)

; re-map E drivers due to the printhead detections

var m = ""
var n = ""

if var.driverZero != -1
	; if dock0 and dock1 in use
	if var.driverOne != -1
		; if dock0, dock1 and dock2 in use
		if var.driverTwo != -1
			M584 E{var.driverZeroF,var.driverOneF,var.driverTwoF}; extruders drive mapping
			M350 E16:16:16 I1 ; configure extruders microstepping with interpolation
			M92 E{var.driverZeroStepsPerMm,var.driverOneStepsPerMm,var.driverTwoStepsPerMm}; extruders steps per mm
			M566 E120.00:120.00:120.00 ; set maximum instantaneous speed changes (mm/min)
			M203 E1200.00:1200.00:1200.00 ; set maximum speeds (mm/min)
			M201 E250.00:250.00:250.00 ; set accelerations (mm/s^2)
			M906 E1000:1000:1000 I30 ; set motor currents (mA) and timeout time
			set var.m = {var.driverZero ^ ".temp0"}
			set var.n = {var.driverZero ^ ".out0"}
			M98 P"dH.g" A{var.dZHId} B{var.m} C{var.dZHR} D{var.dZHE} E{var.dZHD} F{var.dZHS} H{var.dZHMT} I{var.n} J{var.dZHV} K{var.dZHKInit} L{var.dZHKEnd} 
			set var.m = {var.driverOne ^ ".temp0"}
			set var.n = {var.driverOne ^ ".out0"}
			M98 P"dH.g" A{var.dOHId} B{var.m} C{var.dOHR} D{var.dOHE} E{var.dOHD} F{var.dOHS} H{var.dOHMT} I{var.n} J{var.dOHV} K{var.dOHKInit} L{var.dOHKEnd}
			set var.m = {var.driverTwo ^ ".temp0"}
			set var.n = {var.driverTwo ^ ".out0"}
			M98 P"dH.g" A{var.dTHId} B{var.m} C{var.dTHR} D{var.dTHE} E{var.dTHD} F{var.dTHS} H{var.dTHMT} I{var.n} J{var.dTHV} K{var.dTHKInit} L{var.dTHKEnd}
					
			M98 P"declareTool.g" A{var.driverZeroToolName} B0 C{var.dZHId} D0 H{var.driverZero}
			M98 P"declareTool.g" A{var.driverOneToolName} B1 C{var.dOHId} D0 H{var.driverOne}
			M98 P"declareTool.g" A{var.driverTwoToolName} B2 C{var.dTHId} D0 H{var.driverTwo}
		
		else 
			M584 E{var.driverZeroF,var.driverOneF} ; extruders drive mapping
			M350 E16:16 I1 ; configure extruders microstepping with interpolation
			M92 E{var.driverZeroStepsPerMm,var.driverOneStepsPerMm} ; extruders steps per mm
			M566 E120.00:120.00 ; set maximum instantaneous speed changes (mm/min)
			M203 E1200.00:1200.00 ; set maximum speeds (mm/min)
			M201 E250.00:250.00 ; set accelerations (mm/s^2)
			M906 E1000:1000 I30 ; set motor currents (mA) and timeout time

			set var.m = {var.driverZero ^ ".temp0"}
			set var.n = {var.driverZero ^ ".out0"}
			M98 P"dH.g" A{var.dZHId} B{var.m} C{var.dZHR} D{var.dZHE} E{var.dZHD} F{var.dZHS} H{var.dZHMT} I{var.n} J{var.dZHV} K{var.dZHKInit} L{var.dZHKEnd} 
			set var.m = {var.driverOne ^ ".temp0"}
			set var.n = {var.driverOne ^ ".out0"}
			M98 P"dH.g" A{var.dOHId} B{var.m} C{var.dOHR} D{var.dOHE} E{var.dOHD} F{var.dOHS} H{var.dOHMT} I{var.n} J{var.dOHV} K{var.dOHKInit} L{var.dOHKEnd}
			
			M98 P"declareTool.g" A{var.driverZeroToolName} B0 C{var.dZHId} D0 H{var.driverZero}
			M98 P"declareTool.g" A{var.driverOneToolName} B1 C{var.dOHId} D0 H{var.driverOne}
			
	else
		M584 E{var.driverZeroF} ; extruders drive mapping
		M350 E16 I1 ; configure extruders microstepping with interpolation
		M92 E{var.driverZeroStepsPerMm} ; extruders steps per mm
		M566 E120.00 ; set maximum instantaneous speed changes (mm/min)
		M203 E1200.00 ; set maximum speeds (mm/min)
		M201 E250.00 ; set accelerations (mm/s^2)
		M906 E1000 I30 ; set motor currents (mA) and timeout time

		set var.m = {var.driverZero ^ ".temp0"}
			set var.n = {var.driverZero ^ ".out0"}
			M98 P"dH.g" A{var.dZHId} B{var.m} C{var.dZHR} D{var.dZHE} E{var.dZHD} F{var.dZHS} H{var.dZHMT} I{var.n} J{var.dZHV} K{var.dZHKInit} L{var.dZHKEnd}
			
		M98 P"declareTool.g" A{var.driverZeroToolName} B0 C{var.dZHId} D0 H{var.driverZero}

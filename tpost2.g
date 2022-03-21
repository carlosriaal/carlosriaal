if {!move.axes[0].homed} || {!move.axes[1].homed} || {!move.axes[2].homed}
  echo ""
	T-1 P0
else
  M564 S0; disable limits

  M584 Z45.0
  M574 V2 S1 P"nil" 
  M574 Z2 S1 P"!45.io0.in" 

  ;M208 Z{global.twoMin} S1
  ;M208 Z{global.noToolMax + 1} S0 ; zero max = 69.68
  M208 Z{global.twoMin, global.noToolMax+1}
  M208 X-200:200 Y-125:125

  G92 X{-global.tool2XOffset + global.dockTwoXOffset + move.axes[0].machinePosition} Y{-global.tool2YOffset + move.axes[1].machinePosition} ; G57 X and Y offsets

  G1 X0 Y0 F4500
  G91 ; relative positioning
  G1 Z-0.5 F2000 ; move down 5mm for allow compensation
  G90 ; absolute positioning
  M400 ; wait for moves to finish
  G1 H1 Z100 F2000 ; lift Z relative to max position, when it touches, it sets to 69.68+5
  M400 ; wait for moves to finish

  G91 ; relative positioning
  G1 Z-1 F2000 ; move down 5mm for allow compensation
  G90 ; absolute positioning
  M400 ; wait for moves to finish

  M208 Z{global.twoMin, global.noToolMax}

  G57 ; coordinate system 3 (tool 2)

  M564 S1 ; enable axis limits
G53 G1 Z100 F2000;
M400

M564 S0 ; disable axis limits

G53 G1 X0 Y0 F4500
M400 ; wait for moves to finish
G91 ; relative positioning
G1 Z-0.5 F2000 ; move down 5mm for allow compensation
G90 ; absolute positioning
M400 ; wait for moves to finish
G1 H1 Z100 F2000 ; lift Z relative to max position
M400 ; wait for moves to finish
M564 S1 ; enable axis limits

M564 S0 ; disable axis limits

M584 Z43.0
M574 Z2 S1 P"!43.io0.in"

M208 Z{0,global.noToolMax + 1}
M208 X-200:200 Y-64:125 ; X and Y limits (no tool)

G92 X{move.axes[0].machinePosition+global.tool2XOffset - global.dockTwoXOffset} Y{move.axes[1].machinePosition+global.tool2YOffset} ;

G1 X0 Y0 F4500
G91 ; relative positioning
G1 Z-0.5 F2000 ; move down 5mm for allow compensation
G90 ; absolute positioning
M400 ; wait for moves to finish
G1 H1 Z100 F2000 ; lift Z relative to max position
M400 ; wait for moves to finish

G91 ; relative positioning
G1 Z-1 F2000 ; move down 5mm for allow compensation
G90 ; absolute positioning
M400

M208 Z{0,global.noToolMax}

G54

M564 S1 ; enable axis limits

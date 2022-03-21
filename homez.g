M564 S0 ; disable axis limits

G1 X0 Y0 F4500
M400 ; wait for moves to finish
G53 G1 H1 Z100 F2000 ; lift Z relative to max position
M400 ; wait for moves to finish

G91 ; relative positioning
G1 Z-1 F2000 ; move down 5mm for allow compensation
G90 ; absolute positioning
M400

G92 Z{global.noToolMax}

M564 S1 ; enable axis limits

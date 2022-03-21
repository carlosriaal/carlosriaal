; homeall.g
; called to home all axes
;
M564 S0 ; disable axis limits
G29 S2

T-1 P0

G54

M584 P5 ; 5 axis visibles 

M584 Z43.0 U44.0 V45.0
M574 Z2 S1 P"!43.io0.in"
M574 U2 S1 P"!44.io0.in"
M574 V2 S1 P"!45.io0.in"

M208 Z0:100 U0:100 V0:100 S0 ; change max limits
M208 X-200:200 Y-64:125
G91 ; relative positioning

G1 H2 Z-1 U-1 V-1 F2000
G1 H1 Z100 U100 V100 F2000 ; lift ZUV relative to current position
M400
G92 Z100 U100 V100
G1 H1 X-405 Y-255 F3000 ; move quickly to X and Y axis endstops and stop there (first pass)

M584 P3 ; 3 axis visibles

G90 ; absolute positioning

G1 X51 Y0 F3000 ; move to physical X51, Y0 (logical X0,Y0)

M400 ; wait for moves to finish

G92 X0 Y0 ; establish current position as X0,Y0

G30 K0; z probbing

M208 Z0 S1 ; Z axis min limit = 0

G1 H3 Z100 F2000 ; lift Z relative to max position and update M208 Z max limit

M400 ; wait for moves to finish

G91 ; relative positioning
G1 Z-1 F2000 ; move down 1mm for allow compensation
G90 ; absolute positioning

G29 S1 P"heightmap.csv" ; load heightmap

set global.noToolMax = {move.axes[2].machinePosition}
M208 Z{0,move.axes[2].machinePosition}
M564 S1 ; enable axis limits
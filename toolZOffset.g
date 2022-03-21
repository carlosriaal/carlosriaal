; param.A -> tool N

M564 S0 ; disable axis limits
T{param.A} ; select the tool 

G90; absolute positioning
G1 X-1.3 Y106.6 F4500 ; go to switch position
M400 ; wait for moves to finish

G30 K1 S-2 ; probe and do nothing when triggered

M400 ; wait for moves to finish
G10 L20 P{param.A + 2} Z{+global.switchTravel} ; P2 = G55 (tool 0) - P3 = G56 (tool 1) - P4 = G57 (tool 2)
M114 ; report positions

if param.A = 0
    set global.zeroMin = move.axes[2].machinePosition - global.switchTravel
elif param.A = 1
    set global.oneMin = move.axes[2].machinePosition - global.switchTravel
elif param.A = 2
    set global.twoMin = move.axes[2].machinePosition - global.switchTravel

M208 Z{move.axes[2].machinePosition - global.switchTravel} S1 ; min limit

M564 S1
G1 Z100 F2000 ; lift Z relative to max position
M400;
M564 S0
G1 X0 Y0 F4500 ; go to center
M400 ;

M564 S1 ; enable axis limits

T-1










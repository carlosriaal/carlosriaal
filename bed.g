G28
M400;
M561 ; clear any bed transform
G29 S2

G1 X0 Y0 F4500
G30 K0
G29 S0 ; probe the bed and enable compensation

M400 ; wait for movements to finish
G1 Z100 F2000
G1 X0 Y0 F4500




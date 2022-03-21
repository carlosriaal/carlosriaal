; resume.g
; called before a print from SD card is resumed
;
M581 T2 P1 S0 R0	   ; Reactivate trigger 2
G1 R1 Z5 F4000         ; go to 5mm above position of the last print move
G1 R1                  ; go back to the last print move
M83                    ; relative extruder moves


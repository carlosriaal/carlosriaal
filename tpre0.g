if {!move.axes[0].homed} || {!move.axes[1].homed} || {!move.axes[2].homed}
    echo "AXIS NOT HOMED"
else
  M564 S0 ; disable axis limits
  G53 G1 X0 Y0 F4500
  M400 ; wait for moves to finish
  G53 G1 H1 Z100 F2000 ; lift Z relative to max position
  M564 S1 ; enable axis limits
if tools[state.currentTool].name = "PELLETS-2"
    M42 P2 S0.25	;activa el vibrador de la placa Id22 al 25%
    G4 S1		;espera 1 segundo
    M42 P2 S0	;apaga el vibrador 
    G4 S0.5		;espera 1.5 segundos
    M42 P3 S1	;activa el solenoide micropellet de la placa ID22
    G4 S0.8		;espera 2 segundos
    M42 P3 S0	;apaga el solenoide micropellet
if tools[state.currentTool].name = "PELLETS"
    M42 P5 S0.25	;activa el vibrador de la placa Id22 al 25%
    G4 S1		;espera 1 segundo
    M42 P5 S0	;apaga el vibrador 
    G4 S0.5		;espera 1.5 segundos
    M42 P5 S1	;activa el solenoide micropellet de la placa ID21
    G4 S0.8		;espera 2 segundos
    M42 P5 S0	;apaga el solenoide micropellet
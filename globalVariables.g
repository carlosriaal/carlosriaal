; Declaration of global variables

global tool0XOffset = -1;
global tool0YOffset = -1;
global tool1XOffset = -1;
global tool1YOffset = -1;
global tool2XOffset = -1;
global tool2YOffset = -1;

global dockOneXOffset = 86.35
global dockTwoXOffset = 173.55

global switchTravel = -5.25 ; glass + switch height
; Valor mas bajo acerca el cabezal a la cama, valor mas alto lo aleja (en negativo) -- revisar

global noToolMax = 100 ; max limit without tool selected
global noToolMin = 0 ; min limit without tool selected (always 0)

global zeroMin = 0 ; min limit with tool 0
global oneMin = 0 ; min limit with tool 1
global twoMin = 0 ; min limit with tool 2

global lastUpdatedTool = -1 ;
var actualX = move.axes[0].machinePosition
var actualY = move.axes[1].machinePosition

var correctionX = 0
var correctionY = 0

var tool = state.currentTool
set global.lastUpdatedTool = state.currentTool

if state.currentTool = 0
    set var.correctionX = 38.1 - var.actualX ;38.1 is the probe X position at the top of the camera
    set var.correctionY = 105.1 - var.actualY ;105.1 is the probe Y position at the top of the camera
elif state.currentTool = 1
    set var.correctionX = 38.1 - var.actualX ;
    set var.correctionY = 105.1 - var.actualY ;
elif state.currentTool = 2
    set var.correctionX = 38.1 - var.actualX ;
    set var.correctionY = 105.1 - var.actualY ;

M400

T-1

if var.tool = 0
    set global.tool0XOffset = global.tool0XOffset - var.correctionX;
    set global.tool0YOffset = global.tool0YOffset - var.correctionY;
elif var.tool = 1
    set global.tool1XOffset = global.tool1XOffset - var.correctionX;
    set global.tool1YOffset = global.tool1YOffset - var.correctionY;
elif var.tool = 2
    set global.tool2XOffset = global.tool2XOffset - var.correctionX;
    set global.tool2YOffset = global.tool2YOffset - var.correctionY;
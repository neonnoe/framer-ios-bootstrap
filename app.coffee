StatusBar = require "ios/StatusBar"
GhostLayer = require "GhostLayer"

{appSettings} = require "app"
##print appSettings.APP_STATE_STREAM

Framer.Device.screen.backgroundColor = appSettings.APP_BACKGROUND_COLOR

#Ghost Button
myGhost = new GhostLayer
	translucent: false
	
myGhost.backgroundColor = "red"
myGhost.center()

	
# iOS Status Bar
myStatusBar = new StatusBar
	width: Framer.Device.screen.width

#myStatusBar.black()
#myStatusBar.black(true)
#myStatusBar.white()
#myStatusBar.white(true)


myGhost.onTap ->
	myStatusBar.toggleShowHide()
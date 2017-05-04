{moment} = require "npm"
require('moment/locale/de.js');

appSettings = require( "../dist/appsettings.js" );
menuSettings = require( "../dist/menusettings.js" );

@classRef = null

class StatusBar extends Layer

	constructor: (options={}) ->

		# Here we define the initial parameters for the parent/"topmost" layer
		options.height = menuSettings.STATUS_BAR_HEIGHT
		options.backgroundColor = "white"

		super options # Initialize these first parameters above as the default properties for our component

		moment.locale(appSettings.APP_LANG);

		# Import file "iOS Design Kit - Designing Guide" (sizes and positions are scaled 1:2)
		@assetLayer = Framer.Importer.load("imported/iOS Design Kit - Designing Guide@2x")

		@assetLayer.black.visible = false
		@assetLayer.white.visible = false

		@.addChild(@assetLayer.black)
		@.addChild(@assetLayer.white)

		# Set Positions
		@assetLayer.chargeB.x = Screen.width - menuSettings.CHARGE_OFFSET_RIGHT
		@assetLayer.chargeW.x = Screen.width - menuSettings.CHARGE_OFFSET_RIGHT

		# Set multiple states at once 
		@.states =
			show:
				y: 0
				animationOptions:
					curve: Spring(damping: menuSettings.MENU_DAMPING)
					time: menuSettings.MENU_ANIMATION_TIME

			hide:
				y: - menuSettings.STATUS_BAR_HEIGHT
				animationOptions:
					curve: Spring(damping: menuSettings.MENU_DAMPING)
					time: menuSettings.MENU_ANIMATION_TIME
					
		@currTimer = new TextLayer
			name: "currentTime"
			parent: @ # The @ (CoffeeScript shortcut for 'this') tells the layer to stay relative to it's parent container
		


		@createTimer()
		@white(true)

	createTimer: ->
		@currTimer.text = moment().format('LT');
		@currTimer.fontSize = 24
		@currTimer.textAlign = "center"
		@currTimer.center()
		

	white:(transparent) ->
		if transparent is true
			@backgroundColor  = ""
		else
			@backgroundColor  = "white"
		@currTimer.color = "black"
		@assetLayer.black.visible = true
		@assetLayer.white.visible = false

	black: (transparent) ->
		if transparent is true
			@backgroundColor  = ""
		else
			@backgroundColor  = "black"
		@currTimer.color = "white"
		@assetLayer.black.visible = false
		@assetLayer.white.visible = true

	show: ->
		@.animate("show")

	hide: ->
		@.animate("hide")

	toggleShowHide: ->
		@.stateCycle("hide", "show")



module.exports = StatusBar
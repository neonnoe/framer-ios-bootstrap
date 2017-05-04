class GhostLayer extends Layer
	constructor: (@options={}) ->
		@options.translucent ?= false
		super @options
		@.onClick @fade
		
		if @options.translucent is true
			@.opacity = 0.5

	@define 'translucent',
		get: -> 
			@options.translucent
		set: (value) -> 
			@options.translucent = value
			if @options.translucent is true
				@.opacity = 0.5
			else
				@.opacity = 1.0

	fade: Utils.debounce 0.5, ->
		Utils.delay 0.5, =>
			if @options.translucent is true
				@options.translucent = false
				@.animate
					properties:
						opacity: 1.0
			else
				@options.translucent = true
				@.animate
					properties:
						opacity: 0.5
						
module.exports = GhostLayer
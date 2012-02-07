#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Supernote =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  init: (options) ->
  	Supernote.options = options
  	new Supernote.Routers.NotesRouter(options)

  	if !Backbone.history.started
  	  Backbone.history.start()
  	  Backbone.history.started = true


Supernote.Views.Notes ||= {}

class Supernote.Views.Notes.NoteView extends Backbone.View
  template: JST["backbone/templates/notes/note"]
 
  
  events:
    "click .destroy" : "destroy"
    "click .update"  : "noteUpdate"

  tagName: "li"

  destroy: () ->
    getViewAndCollection = ((view) -> return -> {collection: view.collection, view: view})(this)
    
    @model.destroy()
      success: (model, response) ->
        vars = getViewAndCollection()
        vars.collection.remove model
        vars.view.remove()
      error: (model, response) ->
  
    return false
  
  noteUpdate: (note) =>
    view = new Supernote.Views.Notes.IndexView({model : note, collection: @options.notes})
    @$("li").append(view.render().el)

  render: ->
    $(@el).html(@template(@model.toJSON() ))
   

    return this


    
class Supernote.Routers.NotesRouter extends Backbone.Router
  initialize: (options) ->
    @notes = new Supernote.Collections.NotesCollection()
    @notes.reset options.notes

  routes:
    ""          : "index"    
    "/new"      : "newNote"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "super"
    "/super"    : "super"  

  newNote: ->
    @view = new Supernote.Views.Notes.NewView(collection: @notes)
    $("#note").html(@view.render().el)

  index: ->
    @view = new Supernote.Views.Notes.IndexView(notes: @notes)
    $("#notes").html(@view.render().el)
    note = @notes.get(id)

    @view2 = new Supernote.Views.Notes.ShowView(model: note)
    $("#note").html(@view2.render().el)

  show: (id) ->
    note = @notes.get(id)

    @view = new Supernote.Views.Notes.ShowView(model: note)
    $("#note").html(@view.render().el)

  edit: (id) ->
    note = @notes.get(id)

    @view = new Supernote.Views.Notes.EditView(model: note)
    $("#note").html(@view.render().el)

  super: ->
    @listview = Supernote.Views.notes.IndexView(notes: @notes)
    $("#notes").append(listview.render().el)  
  
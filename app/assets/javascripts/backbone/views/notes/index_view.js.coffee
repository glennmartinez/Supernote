Supernote.Views.Notes ||= {}

class Supernote.Views.Notes.IndexView extends Backbone.View
  template: JST["backbone/templates/notes/index"]

  initialize: (options) ->
    @options.notes.bind('reset', @addAll)
    @options.notes.bind('add', @updateNote)
    @options.notes.bind('change', @updateNote)
    @options.notes.bind('delete', @updateNote)
    

  addAll: () =>
    @options.notes.each(@addOne)

  addOne: (note) =>
    view = new Supernote.Views.Notes.NoteView({model : note, collection: @options.notes})
    @$("ul").append(view.render().el)

  updateNote:() =>
    @render()

  render: =>
    $(@el).html(@template(notes: @options.notes.toJSON() ))
    @addAll()

    return this

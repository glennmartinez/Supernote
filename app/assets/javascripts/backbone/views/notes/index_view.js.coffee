Supernote.Views.Notes ||= {}

class Supernote.Views.Notes.IndexView extends Backbone.View
  template: JST["backbone/templates/notes/index"]

  initialize: () ->
    @options.notes.bind('reset','change', @addAll)
    

  addAll: () =>
    @options.notes.each(@addOne)

  addOne: (note) =>
    view = new Supernote.Views.Notes.NoteView({model : note})
    @$("li").append(view.render().el)

  render: =>
    $(@el).html(@template(notes: @options.notes.toJSON() ))
    @addAll()

    return this

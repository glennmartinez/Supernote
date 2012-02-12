class Supernote.Models.Note extends Backbone.Model
  paramRoot: 'note'

  defaults:
    title: null
    content: null
    tag: null
   

class Supernote.Collections.NotesCollection extends Backbone.Collection
  model: Supernote.Models.Note
  url: '/notes'

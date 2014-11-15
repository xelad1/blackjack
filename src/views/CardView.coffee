window.CardView = Backbone.View.extend
  className: 'card'

  template: _.template '<img src=./img/cards/<%= rankName %>-<%= suitName %>.png></img>'

  initialize: -> @render()

  render: ->
    @setSrc()
    @$el.children().detach()
    @$el.addClass 'animated flipInY'
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'


  setSrc: ->
    @template = _.template '<img src=./img/yngwie.gif></img>' unless @.model.get('revealed')

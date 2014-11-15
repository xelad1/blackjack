window.AppView = Backbone.View.extend
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="redeal">Redeal</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': ->
      if @model.get('playerHand').minScore() <= 21
        @model.get('playerHand').hit()
      if @model.get('playerHand').minScore() == 21
        console.log("Blackjack, you win!")
      if @model.get('playerHand').minScore() > 21
        console.log("busto!")
        return

    'click .stand-button': ->
      @model.get('dealerHand').flipFirst()
      @dealerDraw()
      return

    'click .redeal': ->
      @redeal()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  dealerDraw: ->
    playerScore = @model.get('playerHand').minScore()
    dealerScore = @model.get('dealerHand').minScore()

    if dealerScore <= 17 and dealerScore < playerScore
      @model.get('dealerHand').hit()
      dealerScore = @model.get('dealerHand').minScore()
      @dealerDraw()
    if dealerScore > 21
      console.log('You win!!!!')
      return

  redeal: ->
    @model.set('playerHand', @model.get('deck').dealPlayer())
    @model.set('dealerHand', @model.get('deck').dealDealer())
    @initialize()
    return

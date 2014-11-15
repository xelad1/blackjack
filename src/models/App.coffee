# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
window.App = Backbone.Model.extend
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    return


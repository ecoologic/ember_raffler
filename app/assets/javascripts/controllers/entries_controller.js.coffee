Raffler.EntriesController = Ember.ArrayController.extend
  addEntry: (name) ->
    Raffler.Entry.createRecord(name: name)
    @get('store').commit()

  drawWinner: ->
    @setEach 'latest', false
    pool = @rejectProperty 'winner'
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.set 'winner', true
      entry.set 'latest', true
      @get('store').commit()

  allWinners: (->
      @everyProperty('winner')
  ).property('@each.winner') # could also be bound to addEnty

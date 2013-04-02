Raffler.EntriesController = Ember.ArrayController.extend
  addEntry: ->
    Raffler.Entry.createRecord(name: @get('newEntryName'))
    @get('store').commit()
    @set('newEntryName', '')

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

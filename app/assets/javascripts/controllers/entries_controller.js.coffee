Raffler.EntriesController = Ember.ArrayController.extend
  addEntry: ->
    @pushObject Ember.Object.create(name: @get('newEntryName'))
    @set 'newEntryName', ''

  drawWinner: ->
    @setEach 'latest', false
    pool = @rejectProperty 'winner'
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.set 'winner', true
      entry.set 'latest', true

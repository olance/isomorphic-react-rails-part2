EventEmitter = require('events').EventEmitter
Events = require('../constants/common').Events

class BaseStore extends EventEmitter
  constructor: (@name='BaseStore') ->

  # Return true when anything went right.
  # Subclasses must override and handle messages here.
  messageHandler: (payload) -> true


  # Change events methods
  emitChange: -> @emit(Events.CHANGE)

  addChangeListener: (callback) -> @on(Events.CHANGE, callback)
  removeChangeListener: (callback) -> @off(Events.CHANGE, callback)



module.exports = BaseStore
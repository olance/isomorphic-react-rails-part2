Dispatcher = require('flux').Dispatcher
BaseStore = require('./base_store')
ActionTypes = require('../constants/common').ActionTypes

class Context
  constructor: ->
    @_dispatcher = new Dispatcher()
    @dispatch = @_dispatcher.dispatch.bind(@_dispatcher)

    @_stores = {}


  ## Store-related methods
  registerStore: (store) ->
    throw new TypeError('store is not an instance of BaseStore') unless store instanceof BaseStore
    throw new Error('A store with the same name is already registered') if @_stores[store.name]?

    # Register the store locally and its message callback against the dispatcher
    @_stores[store.name] = store
    store.dispatchID = @_dispatcher.register(store.messageHandler.bind(store))

  unregisterStore: (storeOrName) ->
    name = if storeOrName instanceof BaseStore then store.name else storeOrName

    # If a store can be found, unregister it from the dispatcher and remove it from our local list
    store = @_stores[name]
    if store?
      @_dispatcher.unregister(store.dispatchID)
      delete @_stores[name]

  findStore: (storeName) -> @_stores[storeName]


  ## Dispatch the initial state object to all registered stores
  dispatchInitialState: (state) ->
    @dispatch({
      type: ActionTypes.INITIAL_STATE
      data: state
    })



module.exports = Context;
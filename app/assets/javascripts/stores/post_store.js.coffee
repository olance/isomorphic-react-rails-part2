BaseStore = require('../lib/base_store')
ActionTypes = require('../constants/common').ActionTypes
_ = require('lodash')

class PostStore extends BaseStore
  constructor: (@name='PostStore') ->
    @_posts = []
    @_selected = null;


  allPosts: -> _.clone(@_posts)
  currentPost: -> if @_selected? then @_posts[@_selected] else null


  messageHandler: (payload) ->
    switch payload.type

      # App initialization: get the initial list of posts
      when ActionTypes.INITIAL_STATE
        @_posts = _.clone(payload.data.posts) if payload.data.posts?

      else return true

    @emitChange()

    true


module.exports = PostStore
window.Savvy = class Savvy extends Batman.App

  # only for development
  Batman.ViewStore.prefix = 'assets/batman/views'

  Batman.config =
    pathPrefix: 'app'
    usePushState: true

  @root 'home#index'
  @resources 'foods'
  @resources 'drinks'
  @resources 'orders', ->
    @resources 'products'

  @on 'run', ->

  @on 'ready', ->
    console?.log "Savvy ready for use."

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @set(key, '')
        , 2000
      value

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message

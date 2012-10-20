class Savvy.Product extends Batman.Model
  @resourceName: 'product'
  @storageKey: 'products'
  @persist Batman.RailsStorage
  @encode 'id', 'temp', 'type', 'sizes', 'names'
  @encode 'compute', 'size', 'name', 'units', 'grams', 'price_per_gram'
  @encode 'price_rate', 'total', 'modifications', 'food', 'drink'
  @belongsTo 'order'
  @urlNestsUnder 'order'
  
  mod: (node, event, context) ->
    mod = @get 'temp'
    mods = @get 'modifications' ? []  
    @set 'modifications', mods.add(mod).unique().remove('')
    @save (err) ->
      if err
        throw err unless err instanceof Batman.ErrorsSet 

  demod: (node, event, context) ->
    val = context.get 'mod'
    mods = @get 'modifications'
    arr = mods.remove(val)
    @set 'modifications', []
    @set 'modifications', arr
    @save (err) ->
      if err
        throw err unless err instanceof Batman.ErrorsSet

  namer: (arr) ->
    names = ['']
    arr.forEach (item) ->
      names.add(item.get('name'))
    @set 'names', names.unique()

  sizer: (arr) ->
    sizes = ['']
    arr.forEach (item) =>
      if item.get('name') is @get('name')
        sizes.add(item.get('size'))
    @set('sizes', sizes.unique())

  totaler: (type, arr) ->
    arr.forEach (item) =>
      units = @get 'units'
      if type is "Drink"
        if item.get('name') is @get('name') and item.get('size') is @get('size')
          price = item.get 'price'
          total = price * units
          @set 'total', total
          if total > 0
            @set 'compute', true
            $('#runner').css('display', 'block')
      else
        if item.get('name') is @get 'name'
          price_per_gram = item.get 'price_per_gram'
          base_price = item.get 'base_price'
          grams = @get 'grams'
          total = (price_per_gram * grams) + (base_price * units)
          @set 'total', total
          if total > 0
            @set 'compute', true
            $('#runner').css('display', 'block')

  total: (node, event, context) ->
    if event.type is "input" or event.type is "change"
      type = @get 'type'
      if type is "Drink"
        drinks = context.get 'drinks'
        @namer(drinks)
        @sizer(drinks)
        @totaler(type, drinks)
      else
        foods = context.get 'foods'
        @namer(foods)
        @sizer(foods)
        @totaler(type, foods)      
      @save (err) ->
        if err
          throw err unless err instanceof Batman.ErrorsSet 
      context.get('order').total()

  reset: (node, event, context) ->
    names = ['']
    @set 'size', ''
    @set 'grams', 0
    @set 'name', ''
    @set 'units', 0
    @set 'total', 0
    @set 'compute', false
    @set 'modifications', []
    switch @get 'type'
      when "Drink"
        context.get('drinks').forEach (a) ->
          names.add(a.get('name'))
        @set 'names', names.unique()
        @set 'food', false
        @set 'drink', true
      when "Food"
        context.get('foods').forEach (a) ->
          names.add(a.get('name'))
        @set 'names', names.unique()
        @set 'food', true
        @set 'drink', false
    @save (err) ->
      if err
        throw err unless err instanceof Batman.ErrorsSet
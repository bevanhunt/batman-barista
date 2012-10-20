class Savvy.FoodsController extends Batman.Controller
  routingKey: 'foods'

  new: (params) ->
    @set 'food', new Savvy.Food()
    @form = @render()

  index: (params) ->
    foods = Savvy.Food.get('all').sortedBy('name')
    @set 'foods', foods
    @set 'food', new Savvy.Food

  show: (params) ->
    food = Savvy.Food.find params.id, (err) ->
      throw err if err
    @set 'food', food

  edit: (params) ->
    food = Savvy.Food.find params.id, (err) ->
      throw err if err
    @set 'food', food
    @form = @render()

  update: (params) ->
    food = @get('food')
    name = food.get('name')
    food.set('name', name.capitalize())
    food.save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect Savvy.Food

  create: (params) ->
    food = @get('food')
    name = food.get('name')
    food.set('name', name.capitalize())
    food.save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect Savvy.Food
class Savvy.DrinksController extends Batman.Controller
  routingKey: 'drinks'

  new: (params) ->
    @set 'drink', new Savvy.Drink()
    @set 'sizes', new Batman.Set('Small', 'Medium', 'Large')
    @form = @render()

  index: (params) ->
    drinks = Savvy.Drink.get('all').sortedBy('name')
    @set 'drinks', drinks
    @set 'drink', new Savvy.Drink

  show: (params) ->
    drink = Savvy.Drink.find params.id, (err) ->
      throw err if err
    @set 'drink', drink

  edit: (params) ->
    drink = Savvy.Drink.find params.id, (err) ->
      throw err if err
    @set 'drink', drink
    @set 'sizes', new Batman.Set('Small', 'Medium', 'Large')
    @form = @render()

  update: (params) ->
    drink = @get('drink')
    name = drink.get('name')
    drink.set('name', name.capitalize())
    drink.save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect Savvy.Drink

  create: (params) ->
    drink = @get('drink')
    name = drink.get('name')
    drink.set('name', name.capitalize())
    drink.save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect Savvy.Drink
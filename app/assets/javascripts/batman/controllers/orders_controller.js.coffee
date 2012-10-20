class Savvy.OrdersController extends Batman.Controller
  routingKey: 'orders'
  @afterFilter 'show', -> 
    order = @get 'order'  
    total = order.get('total_f') ? 0
    if total > 0 
      $('#runner').css('display', 'block')

  new: (params) ->
    @set 'order', new Savvy.Order()
    @set 'baristas', new Batman.Set('Kim', 'Janice', 'Heather', 'Paul')
    @form = @render()

  index: (params) ->
    orders = Savvy.Order.get('all').sortedBy('number')
    @set 'orders', orders

  edit: (params) ->

  show: (params) ->
    order = Savvy.Order.find params.id, (err, result) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
    @set 'order', order
    @set 'drinks', Savvy.Drink.get('all')
    @set 'foods', Savvy.Food.get('all')
    @set 'food_modifications', new Batman.Set('Heat', 'Grill', 'Add Cheese', 'Add Bacon')
    @set 'drink_modifications', new Batman.Set('Shot of Expresso', 'Extra Cream', 'Soy Milk', 'Low Fat') 
    @set 'baristas', new Batman.Set('Kim', 'Janice', 'Heather', 'Paul')
    @set 'statuses', new Batman.Set('Waiting', 'Making', 'Done')
    order.get('products').load (err, results) =>
      if err
        throw err
      else 
        @set 'products', results
    @set 'types', new Batman.Set('', 'Food', 'Drink')

  update: (params) ->
    @get('order').save (err) ->
      if err
        throw err unless err instanceof Batman.ErrorsSet

  create: (params) ->
    order = @get('order')
    order.set('status', 'Waiting')
    order.save (err, order) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect order

  productDestroy: (node, event, context) =>
    el = context.get('product')
    el.destroy (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        order = context.get('order')
        order.total()
        if order.get('total_f') is 0
          $('#runner').css('display', 'none')

  productCreate: (node, event, context) =>
    el = new Savvy.Product(order_id: @get('order').get('id'))
    el.save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet  
    
class Savvy.Order extends Batman.Model
  @resourceName: 'order'
  @storageKey: 'orders'
  @persist Batman.RailsStorage
  @encode 'id', 'number', 'sizes', 'hst', 'sub_total', 'total'
  @encode 'barista', 'status', 'items', 'sub_total_f', 'total_f', 'hst_f'
  @hasMany 'products'
  @validate 'barista', presence: yes
  @validate 'status', presence: yes

  @accessor 'tax', -> 0.12

  delete: (node, event, context) ->
    @destroy (err) ->
      if err
        throw err unless err instanceof Batman.ErrorsSet

  total: ->
    total = 0
    hst = 0
    sub_total = 0
    @get('products').forEach (product) =>
      total = total + (product.get('total') * (1 + @get('tax')))
      sub_total = sub_total + product.get('total')
      hst = hst + (product.get('total') * @get('tax'))
    @set 'total', accounting.formatMoney(total)
    @set 'hst', accounting.formatMoney(hst)
    @set 'sub_total', accounting.formatMoney(sub_total)
    @set 'total_f', total
    @set 'hst_f', hst
    @set 'sub_total_f', sub_total
    # format all the sub-totals
    $('.total').each (x) ->
      val = $(this).text()
      price = accounting.formatMoney(val)
      $(this).text(price)
    @save (err) ->
      if err
        throw err unless err instanceof Batman.ErrorsSet

  reset: ->
    @set 'total_f', 0
    @set 'hst_f', 0
    @set 'sub_total_f', 0
    @set 'hst', '$0'
    @set 'total', '$0'
    @set 'sub_total', '$0'
    @save (err) ->
      if err
        throw err unless err instanceof Batman.ErrorsSet
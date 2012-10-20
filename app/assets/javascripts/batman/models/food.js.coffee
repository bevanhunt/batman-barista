class Savvy.Food extends Batman.Model
  @resourceName: 'food'
  @storageKey: 'foods'
  @persist Batman.RailsStorage
  @encode 'id', 'price_per_gram', 'base_price', 'name'
  @validate 'price_per_gram', presence: yes, numeric: yes
  @validate 'base_price', presence: yes, numeric: yes
  @validate 'name', presence: yes

  delete: (node, event, context) ->
    @destroy (err) ->
      if err
        throw err unless err instanceof Batman.ErrorsSet
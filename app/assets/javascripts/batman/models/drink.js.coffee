class Savvy.Drink extends Batman.Model
  @resourceName: 'drink'
  @storageKey: 'drinks'
  @persist Batman.RailsStorage
  @encode 'id', 'price', 'name', 'size'
  @validate 'price', presence: yes, numeric: yes
  @validate 'name', presence: yes
  @validate 'size', presence: yes

  delete: (node, event, context) ->
    @destroy (err) ->
      if err
        throw err unless err instanceof Batman.ErrorsSet
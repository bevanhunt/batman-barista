Batman.mixins.priceFormat =
  initialize: ->
    $node = $(@)
    price = accounting.formatMoney($node.text())
    $node.text(price)
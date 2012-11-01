# Barista - CoffeeShop Ordering System
## How to use:
  1. git clone https://github.com/bevanhunt/batman-barista.git
  2. cd batman-barista
  3. bundle install
  4. rails server
  5. open browser to http://localhost:3000

## Why:
  Meteor.js vs. Batman-Rails using a LOB app

## Notes: 
  * When you update foods or drinks - the updated versions will only be available to products that have not been added to an order yet

## Demo:
  http://barsavvy.herokuapp.com

## Meteor-Barista:
  https://github.com/bevanhunt/meteor-barista

## Comparsion:
  Batman-Rails:
    
    Pros:
      * Full MVC REST support built-in
      * HTML data-bindings
      * Validations built-in
      * HTML templating language - HAML (optional)
      * Model relationship keywords (rather than having to set MongoDB keys manually)

    Cons: 
      * Bad documentation 
      * 3 specified model schemas (duplication) = ActiveModel, JSON Serializer, and Batman Models
      * Real-time is not built-in (no real-time in Batman-Barita)
      * Manually refreshing browser is required to see app changes
  
  Meteor.js:
  
    Pros:
      * The same schemaless model on both server and client = no duplication 
      * Real-time built-in 
      * Auto-refreshes browser on app changes 
      * Decent documentation
  
    Cons:
      * Validations are not built-in - overcome with 3rd party library (Knockout)
      * Client-side REST requires manually writing Backbone routes - using 3rd party library (Reactive Router)
      * Writing HTML in Handlebars - should support Jade and native data-bindings
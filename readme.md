# Barista - CoffeeShop Ordering System
## How to use:
  1. git clone https://github.com/bevanhunt/batman-barista.git
  2. cd batman-barista
  3. bundle install
  4. rails server
  5. open browser to http://localhost:3000

## Why:
  Meteor.js vs. Batman-Rails using a MVC forms app

## Comparsion:
  Batman-Rails:
  >>   
    * Pros:
  >>>
    ** Full MVC REST support built-in

    ** HTML data-bindings
      
    ** Validations built-in
      
    ** HTML templating language - HAML (optional)
      
    ** Model relationship keywords (rather than having to set MongoDB keys manually)
  >> 
    * Cons: 
  >>>
      ** Bad documentation 
    
      ** 3 specified model schemas (duplication) = ActiveModel, JSON Serializer, and Batman Models
    
      ** Real-time is not built-in
    
      ** Manually refreshing browser is required to see app changes
    
      ** Manually via jQuery set that the first option for a dropdowns is selected or it will be undefined
  
  Meteor.js:
  >>
    * Pros:
  >>>  
      ** The same schemaless model on both server and client = no duplication 
     
      ** Real-time built-in
     
      ** Auto-refreshes browser on app changes 
     
      ** Decent documentation
     
      ** Automatically selects first option in dropdowns and is not undefined
  >>    
    * Cons:
  >>>  
      ** Validations are not built-in
    
      ** Client-side REST requires manually writing Backbone routes - requires a 3rd party library (Reactive Router)
    
      ** No HTML templating language - should support Jade 
    
      ** Has no concept of form value preservation

## Meteor-Barista:
  https://github.com/bevanhunt/meteor-barista

## Demo:
  [http://barsavvy.herokuapp.com](http://barsavvy.herokuapp.com "Demo")
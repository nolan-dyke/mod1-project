# The Colorado Beer Suggester

## Table of Contents
* [General Info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Code Examples](#code-examples)
* [Features](#features)
* [Status](#status)
* [Contact](#contact)
* [License](#license)

## General Info

The Colorado Beer Suggester is a CLI app which takes user input and accordingly suggests a beer from a Colorado microbrewery to try from its database. 

## Technologies

Ruby - Version 2.6.1
ActiveRecord - Version 6.0 
Sinatra - Version 2.0
Sinatra-activerecord -  Version 2.0
SQLite3 - Version 1.4
TTY Toolkit

## Setup

This program comes equipped with all necessary gems. To use them locally, execute the command:

`$ bundle`

To install and use the database, run the commands:

`$ rake db:seed `

and 

`$ rake db:migrate`

Finally, run the program with:

`$ ruby runner.rb`

## Code Examples

```ruby
    def beer_information(selection)
        chosen_beer = Beer.all.find do |beer|
        beer.name == selection 
        end
        table = TTY::Table.new ["Name", "Type", "Brewery", "ABV"], [["#{chosen_beer.name}", "#{chosen_beer.beer_type}", "#{chosen_beer.brewery.name}", "#{chosen_beer.abv}"]]
        puts table.render(:unicode) 
        puts "\n"
        add_to_favorites(@user, chosen_beer)
    end
```

```ruby        
if view_favorites_question
  favorite_beers = Favorite.all.map do |favorite|
      favorite.beer
    end.uniq
  puts "\n\n"
  table = TTY::Table.new header: ["Beer", "Type", "Brewery", "ABV"] do |t|
      favorite_beers.each do |beer|
           t << ["#{beer.name}", "#{beer.beer_type}", "#{beer.brewery.name}", "#{beer.abv}"]
      end 
  end 
```
    
## Features

* Browse beers by beer type
* Return suggestions based on beer type
* See beer details
* Save beers to “to try” list
* Remove beers from “to try” list
* View “to try” list
* Ability to quit application

Future features to be added:

* Add API functionality to expand database
* Ability to search by state
* Contact and location info for breweries
* Ability for users to add suggestions

## Status

Project is: completed with option to add future functionality.

## Contact

Created by [Nolan Dyke](www.linkedin.com/in/nolan-dyke) and 
[Chris Banta](http://www.linkedin.com/in/chris-banta)

## License

[Click to view](https://github.com/stein0209/TacoLandia/blob/master/License.txt)
class User < ActiveRecord::Base
    has_many :beers
    has_many :breweries, through: :beer
end 
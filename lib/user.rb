class User < ActiveRecord::Base
    has_many :beers, through: :favorites
    #has_many :breweries, through: :beer
end 
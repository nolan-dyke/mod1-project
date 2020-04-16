class Favorite < ActiveRecord::Base
   # belongs_to :brewery
    belongs_to :user
    belongs_to :beer
end 
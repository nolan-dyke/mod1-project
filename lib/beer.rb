class Beer < ActiveRecord::Base
    belongs_to :brewery
    has_many :users, through: :favorites
end 
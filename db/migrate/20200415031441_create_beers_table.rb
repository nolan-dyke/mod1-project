class CreateBeersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :type
      t.integer :abv
      t.references :brewery, foreign_key: true
      t.references :user, foreign_key: true
    end 
  end
end

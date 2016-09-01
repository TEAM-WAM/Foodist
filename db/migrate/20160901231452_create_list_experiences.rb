class CreateListExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :list_experiences do |t|
      t.string :main_dish, limit: 100
      t.integer :price, limit: 10
      t.integer :party_size, limit: 5
      t.time :time_seated
      t.time :time_waiting
      t.text :notes, limit: 200
      t.integer :list_restaurant_id, null: false

      t.timestamps null: false
    end
  end
end

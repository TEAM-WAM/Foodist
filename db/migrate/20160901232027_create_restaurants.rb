class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :restaurant_url
      t.string :address
      t.string :locality
      t.string :city
      t.string :zipcode
      t.string :average_cost_for_two
      t.string :featured_img
      t.string :menu_url
      t.boolean :has_online_delivery
      t.string :cuisines
      t.string :restaurant_id

      t.timestamps null: false
    end
  end
end

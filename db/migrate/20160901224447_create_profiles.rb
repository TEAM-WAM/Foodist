class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text :bio, null: false, limit: 300
      t.string :zipcode, null: false, limit: 10
      t.date :birthday, null: false
      t.string :phone_number, null: false, limit: 16
      t.string :gender, null: false, limit: 50
      t.string :image, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end

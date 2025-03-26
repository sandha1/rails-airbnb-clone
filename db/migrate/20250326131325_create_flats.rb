class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.text :description
      t.integer :price_per_night
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :neighborhood
      t.string :zip_code
    end
  end
end

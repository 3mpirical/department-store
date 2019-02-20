class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :inventory
      t.integer :year_opened
      t.string :description

      t.timestamps
    end
  end
end

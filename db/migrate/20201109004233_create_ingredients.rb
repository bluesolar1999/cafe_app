class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :cafe_id
      t.timestamps
    end
    add_index :ingredients, :cafe_id
  end
end

class CreateCafes < ActiveRecord::Migration[5.2]
  def change
    create_table :cafes do |t|
      t.string :name
      t.text :order
      t.text :description
      t.text :reference
      t.integer :popularity
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :cafes, [:user_id, :created_at]
  end
end

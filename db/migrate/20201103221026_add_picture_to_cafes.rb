class AddPictureToCafes < ActiveRecord::Migration[5.2]
  def change
    add_column :cafes, :picture, :string
  end
end

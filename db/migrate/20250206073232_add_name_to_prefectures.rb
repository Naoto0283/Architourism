class AddNameToPrefectures < ActiveRecord::Migration[7.2]
  def change
    add_column :prefectures, :name, :string
    add_index :prefectures, :name, unique: true
  end
end

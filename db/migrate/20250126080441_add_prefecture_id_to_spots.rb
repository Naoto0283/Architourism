class AddPrefectureIdToSpots < ActiveRecord::Migration[7.2]
  def change
    add_column :spots, :prefecture_id, :integer
  end
end

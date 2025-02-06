class AddIndexToPrefectureIdInSpots < ActiveRecord::Migration[7.2]
  def change
    add_index :spots, :prefecture_id, name: "index_spots_on_prefecture_id"
  end
end

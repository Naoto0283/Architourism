class Spot < ApplicationRecord

  geocoded_by :address
  after_validation :geocode
  validates :name, :latitude, :longitude, :place_id, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  has_many :review, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # ransackの検索可能な属性を定義
  def self.ransackable_attributes(auth_object = nil)
    ["address", "category_id", "created_at", "id", "id_value", "latitude", "longitude", "name", "opening_hours", "phone_number", "photo_reference", "place_id", "postal_code", "rating", "updated_at", "web_site"]
  end
  # 検索可能な関連付けを追加
  def self.ransackable_associations(auth_object = nil)
    ["category"] 
  end
end

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :spots
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_spots, through: :bookmarks, source: :spot

  has_many :authentications, :dependent => :destroy

  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  def bookmark?(spot)
    bookmarks.exists?(spot_id: spot.id)
  end

  def bookmark(spot)
    bookmarks.create(spot: spot) unless bookmark?(spot)
  end

  def unbookmark(spot)
    bookmarks.find_by(spot: spot)&.destroy
  end
end

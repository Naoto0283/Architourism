class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :spots
  has_many :review, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_spots, through: :bookmarks, source: :spot

  # 外部サービス（GoogleやFacebookなど）の認証情報を Authentication モデルに保存するための関連付け
  has_many :authentications, :dependent => :destroy
  # ユーザー作成時に Authentication モデルの情報も同時に保存できるようにする
  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  # ブックマーク機能
  # Spotをブックマークしているか確認するメソッド
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

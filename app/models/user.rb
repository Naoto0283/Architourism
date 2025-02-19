class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :review, dependent: :destroy

  # 外部サービス（GoogleやFacebookなど）の認証情報を Authentication モデルに保存するための関連付け
  has_many :authentications, :dependent => :destroy
  # ユーザー作成時に Authentication モデルの情報も同時に保存できるようにする
  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
end

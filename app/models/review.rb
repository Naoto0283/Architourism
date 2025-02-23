class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :body, presence: true, length: { maximum: 200 }

  # ransackの検索可能な属性を定義
  def self.ransackable_attributes(auth_object = nil)
    ["body"]
  end
  # 検索可能な関連付けを追加
  def self.ransackable_associations(auth_object = nil)
    [] 
  end
end

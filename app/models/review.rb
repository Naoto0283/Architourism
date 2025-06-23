class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :body, presence: true, length: { maximum: 200 }

  def self.ransackable_attributes(auth_object = nil)
    ["spot_id", "body", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["spot"] 
  end
end

require 'rails_helper'

RSpec.describe Spot, type: :model do 

  describe '.ransackable_attributes' do
    it '検索可能な属性の配列を返すこと' do
      expected_attributes = %w[
        address category_id created_at id id_value latitude longitude name opening_hours phone_number
        photo_reference place_id postal_code rating updated_at web_site
      ]
      expect(Spot.ransackable_attributes).to eq(expected_attributes)
    end
  end

  describe '.ransackable_associations' do
    it '検索可能な関連の配列を返すこと' do
      expected_associations = %w[category]
      expect(Spot.ransackable_associations).to eq(expected_associations)
    end
  end
end

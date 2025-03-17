require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '.ransackable_attributes' do
    it '検索可能な関連の配列を返すこと' do
      expected_attributes = %w[body]
      expect(Review.ransackable_attributes).to eq(expected_attributes)
    end
  end
end

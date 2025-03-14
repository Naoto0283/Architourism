require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    context 'ユーザー登録できるとき' do
      it 'すべての値が正しく入力されている場合' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    context 'ユーザー登録ができないとき' do
      it 'ユーザー名が空欄' do
        user = FactoryBot.build(:user)
        user.name = ''
        expect(user).to be_invalid
      end

      it 'メールアドレスが空欄' do
        user = FactoryBot.build(:user)
        user.email = ''
        expect(user).to be_invalid
      end

      it 'パスワードが空欄' do
        user = FactoryBot.build(:user)
        user.password = ''
        expect(user).to be_invalid
      end

      it '確認用パスワードが空欄' do
        user = FactoryBot.build(:user)
        user.password_confirmation = ''
        expect(user).to be_invalid
      end

      it 'メールアドレスがすでに存在している' do
        FactoryBot.create(:user, email: 'test@example.com')
        user = FactoryBot.build(:user, email: 'test@example.com')
        expect(user).to be_invalid
      end

      it '確認用パスワードの不一致' do
        user = FactoryBot.build(:user)
        user.password_confirmation = 'falsepassword'
        expect(user).to be_invalid
      end
    end
  end
end

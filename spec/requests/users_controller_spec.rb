require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'ユーザー登録' do
    context 'newアクション' do
      it 'ユーザー登録ページが正常に表示されること' do
        get new_user_path
        assert_response :success
      end
    end
  end

  context 'createアクション' do
    it 'ユーザー登録が成功したとき' do
      user_params = { user: FactoryBot.attributes_for(:user) }
      post users_path, params: user_params
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(flash[:notice]).to eq("ユーザー登録が完了しました")
    end

    it 'ユーザー登録が失敗したとき' do
      user_params = { user: FactoryBot.attributes_for(:user, password_confirmation: "different_password") }
      post users_path, params: user_params
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.status).to eq(422)
      expect(flash[:alert]).to eq("ユーザー登録に失敗しました")
    end
  end
end

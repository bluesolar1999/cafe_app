require "rails_helper"

RSpec.describe "料理編集", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:cafe) { create(:cafe, user: user) }

  context "認可されたユーザーの場合" do
    it "レスポンスが正常に表示されること" do
      login_for_request(user)
      get edit_cafe_path(cafe)
      expect(response).to redirect_to edit_cafe_url(cafe)
      patch cafe_path(cafe), params: { cafe: { name: "イカの塩焼き",
                                               description: "冬に食べたくなる、身体が温まる料理です",
                                               order: "coffee",
                                               reference: "https://cookpad.com/recipe/2798655",
                                               popularity: 5 } }
      redirect_to cafe
      follow_redirect!
      expect(response).to render_template('cafes/show')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      # 編集
      get edit_cafe_path(cafe)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
      # 更新
      patch cafe_path(cafe), params: { cafe: { name: "イカの塩焼き",
                                               description: "冬に食べたくなる、身体が温まる料理です",
                                               order: "coffee",
                                               reference: "https://cookpad.com/recipe/2798655",
                                               popularity: 5 } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end

  context "別アカウントのユーザーの場合" do
    it "ホーム画面にリダイレクトすること" do
      # 編集
      login_for_request(other_user)
      get edit_cafe_path(cafe)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
      # 更新
      patch cafe_path(cafe), params: { cafe: { name: "イカの塩焼き",
                                               description: "冬に食べたくなる、身体が温まる料理です",
                                               order: "coffee",
                                               reference: "https://cookpad.com/recipe/2798655",
                                               popularity: 5 } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end
end

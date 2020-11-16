require "rails_helper"

RSpec.describe "投稿一覧ページ", type: :request do
  let!(:user) { create(:user) }
  let!(:cafe) { create(:cafe, :ingredients, user: user) }

  context "ログインしているユーザーの場合" do
    it "レスポンスが正常に表示されること" do
      login_for_request(user)
      get cafes_path
      expect(response).to have_http_status "200"
      expect(response).to render_template('cafes/index')
    end

    it "CSV出力がエラーなく行えること" do
      login_for_request(user)
      get cafes_path(format: :csv)
      expect(response).to have_http_status "200"
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get cafes_path
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end
end

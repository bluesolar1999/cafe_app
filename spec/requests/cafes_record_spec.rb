require "rails_helper"

RSpec.describe "カフェ登録", type: :request do
  let!(:user) { create(:user) }
  let!(:cafe) { create(:cafe, user: user) }
  let(:picture_path) { File.join(Rails.root, 'spec/fixtures/test_cafe.jpg') }
  let(:picture) { Rack::Test::UploadedFile.new(picture_path) }
  let!(:other_user) { create(:user) }

  context "ログインしているユーザーの場合" do
    before do
      get new_cafe_path
      login_for_request(user)
    end

    context "フレンドリーフォワーディング" do
      it "レスポンスが正常に表示されること" do
        expect(response).to redirect_to new_cafe_url
      end
    end

    it "有効なカフェデータで登録できること" do
      expect {
        post cafes_path, params: { cafe: { name: "イカの塩焼き",
                                           description: "冬に食べたくなる、身体が温まる料理です",
                                           order: "coffee",
                                           reference: "https://cookpad.com/recipe/2798655",
                                           popularity: 5,
                                           picture: picture,
                                           ingredients_attributes: [
                                            name: "横浜" ] } }
      }.to change(Cafe, :count).by(1)
      redirect_to Cafe.first
      follow_redirect!
      expect(response).to render_template('cafes/show')
    end

    it "材料のデータも同時に増えること" do
      expect {
        post cafes_path, params: { cafe: { name: "イカの塩焼き",
                                            ingredients_attributes: [
                                              name: "横浜"] } }
      }.to change(Ingredient, :count).by(1)
    end

    it "無効なカフェデータでは登録できないこと" do
      expect {
        post cafes_path, params: { cafe: { name: "",
                                           description: "冬に食べたくなる、身体が温まる料理です",
                                           order: "coffee",
                                           reference: "https://cookpad.com/recipe/2798655",
                                           popularity: 5,
                                           picture: picture,
                                           ingredients_attributes: [
                                            name: "横浜"] } }
      }.not_to change(Cafe, :count)
      expect(response).to render_template('cafes/new')
    end

    context "材料無しの料理登録" do
      it "正常に完了すること" do
        expect {
          post cafes_path, params: { cafe: { name: "イカの塩焼き" } }
        }.to change(Cafe, :count).by(1)
      end

      it "材料のデータは増えないこと" do
      expect {
        post cafes_path, params: { cafe: { name: "イカの塩焼き" } }
      }.not_to change(Ingredient, :count)
      end
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get new_cafe_path
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end
end

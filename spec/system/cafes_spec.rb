require 'rails_helper'

RSpec.describe "Dishes", type: :system do
  let!(:user) { create(:user) }

  describe "料理登録ページ" do
    before do
      login_for_system(user)
      visit new_dish_path
    end

    context "ページレイアウト" do
      it "「料理登録」の文字列が存在すること" do
        expect(page).to have_content 'カフェ登録'
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('カフェ登録')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content '料理名'
        expect(page).to have_content '説明'
        expect(page).to have_content '注文したもの'
        expect(page).to have_content '作り方参照用URL'
        expect(page).to have_content '人気度 [1~5]'
      end
    end

    context "料理登録処理" do
      it "有効な情報で料理登録を行うと料理登録成功のフラッシュが表示されること" do
        fill_in "料理名", with: "イカの塩焼き"
        fill_in "説明", with: "冬に食べたくなる、身体が温まる料理です"
        fill_in "注文したもの" with "coffee"
        fill_in "作り方参照用URL", with: "https://cookpad.com/recipe/2798655"
        fill_in "人気度", with: 5
        click_button "登録する"
        expect(page).to have_content "カフェが登録されました！"
      end

      it "無効な情報で料理登録を行うと料理登録失敗のフラッシュが表示されること" do
        fill_in "料理名", with: ""
        fill_in "説明", with: "冬に食べたくなる、身体が温まる料理です"
        fill_in "注文したもの" with "coffee"
        fill_in "作り方参照用URL", with: "https://cookpad.com/recipe/2798655"
        fill_in "人気度", with: 5
        click_button "登録する"
        expect(page).to have_content "カフェ名を入力してください"
      end
    end
  end
end

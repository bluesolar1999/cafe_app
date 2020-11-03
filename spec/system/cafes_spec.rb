require 'rails_helper'

RSpec.describe "Cafes", type: :system do
  let!(:user) { create(:user) }

  describe "カフェ登録ページ" do
    before do
      login_for_system(user)
      visit new_cafe_path
    end

    context "ページレイアウト" do
      it "「カフェ登録」の文字列が存在すること" do
        expect(page).to have_content 'カフェ登録'
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('カフェ登録')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content 'カフェ名'
        expect(page).to have_content '説明'
        expect(page).to have_content '注文したもの'
        expect(page).to have_content '参照URL'
        expect(page).to have_content '人気度 [1~5]'
      end
    end

    context "カフェ登録処理" do
      it "有効な情報でカフェ登録を行うとカフェ登録成功のフラッシュが表示されること" do
        fill_in "カフェ名", with: "スターバックス"
        fill_in "説明", with: "冬に食べたくなる、身体が温まる料理です"
        fill_in "注文したもの", with: "coffee"
        fill_in "参照URL", with: "https://cookpad.com/recipe/2798655"
        fill_in "人気度", with: 5
        click_button "登録する"
        expect(page).to have_content "カフェが登録されました！"
      end

      it "無効な情報でカフェ登録を行うとカフェ登録失敗のフラッシュが表示されること" do
        fill_in "カフェ名", with: ""
        fill_in "説明", with: "冬に食べたくなる、身体が温まる料理です"
        fill_in "注文したもの", with: "coffee"
        fill_in "参照URL", with: "https://cookpad.com/recipe/2798655"
        fill_in "人気度", with: 5
        click_button "登録する"
        expect(page).to have_content "カフェ名を入力してください"
      end
    end
  end
end

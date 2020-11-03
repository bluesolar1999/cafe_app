require 'rails_helper'

RSpec.describe "Cafes", type: :system do
  let!(:user) { create(:user) }
  let!(:cafe) { create(:cafe, user: user) }

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

  describe "カフェ詳細ページ" do
    context "ページレイアウト" do
      before do
        login_for_system(user)
        visit cafe_path(cafe)
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title("#{cafe.name}")
      end

      it "カフェ情報が表示されること" do
        expect(page).to have_content cafe.name
        expect(page).to have_content cafe.description
        expect(page).to have_content cafe.order
        expect(page).to have_content cafe.reference
        expect(page).to have_content cafe.popularity
      end
    end
  end

  describe "料理編集ページ" do
    before do
      login_for_system(user)
      visit cafe_path(cafe)
      click_link "編集"
    end

    context "ページレイアウト" do
      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('カフェ情報の編集')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content 'カフェ名'
        expect(page).to have_content '説明'
        expect(page).to have_content '注文したもの'
        expect(page).to have_content '参照URL'
        expect(page).to have_content '人気度 [1~5]'
      end
    end

    context "カフェの更新処理" do
      it "有効な更新" do
        fill_in "カフェ名", with: "編集：イカの塩焼き"
        fill_in "説明", with: "編集：冬に食べたくなる、身体が温まる料理です"
        fill_in "注文したもの", with: "coffee"
        fill_in "参照URL", with: "henshu-https://cookpad.com/recipe/2798655"
        fill_in "人気度", with: 1
        click_button "更新する"
        expect(page).to have_content "カフェ情報が更新されました！"
        expect(cafe.reload.name).to eq "編集：イカの塩焼き"
        expect(cafe.reload.description).to eq "冬に食べたくなる、身体が温まる料理です"
        expect(cafe.reload.order).to eq "coffee"
        expect(cafe.reload.reference).to eq "henshu-https://cookpad.com/recipe/2798655"
        expect(cafe.reload.popularity).to eq 1
      end

      it "無効な更新" do
        fill_in "カフェ名", with: ""
        click_button "更新する"
        expect(page).to have_content 'カフェ名を入力してください'
        expect(cafe.reload.name).not_to eq ""
      end
    end
  end
end

require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "トップページ" do
    context "ページ全体" do
      before do
        visit root_path
      end

      it "カフェアプリの文字列が存在することを確認" do
        expect(page).to have_content 'カフェアプリ'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title
      end
    end
  end

  describe "ヘルプページ" do
    before do
      visit about_path
    end

    it "カフェアプリとは？の文字列が存在することを確認" do
      expect(page).to have_content 'カフェアプリとは？'
    end

    it "正しいタイトルが表示されることを確認" do
      expect(page).to have_title full_title('カフェアプリとは？')
    end
  end

  describe "利用規約ページ" do
    before do
      visit use_of_terms_path
    end

    it "利用規約の文字列が存在することを確認" do
      expect(page).to have_content '利用規約'
    end

    it "正しいタイトルが表示されることを確認" do
      expect(page).to have_title full_title('利用規約')
    end

    context "カフェフィード", js: true do
      let!(:user) { create(:user) }
      let!(:cafe) { create(:cafe, user: user) }
      before do
        login_for_system(user)
      end

      it "カフェのぺージネーションが表示されること" do
        login_for_system(user)
        create_list(:cafe, 6, user: user)
        visit root_path
        expect(page).to have_content "みんなのカフェ (#{user.cafes.count})"
        expect(page).to have_css "div.pagination"
        Cafe.take(5).each do |d|
          expect(page).to have_link d.name
        end
      end
      it "「新しいカフェを作る」リンクが表示されること" do
        visit root_path
        expect(page).to have_link "新しいカフェを投稿", href: new_cafe_path
      end
    end
  end
end

require 'rails_helper'

RSpec.describe "Cafes", type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:cafe) { create(:cafe, :picture, user: user) }
  let!(:comment) { create(:comment, user_id: user.id, cafe: cafe) }

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
        attach_file "cafe[picture]", "#{Rails.root}/spec/fixtures/test_cafe.jpg"
        click_button "登録する"
        expect(page).to have_content "カフェが登録されました！"
      end

      it "画像無しで登録すると、デフォルト画像が割り当てられること" do
        fill_in "カフェ名", with: "イカの塩焼き"
        click_button "登録する"
        expect(page).to have_link(href: cafe_path(Cafe.first))
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

  describe "投稿編集ページ" do
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
        attach_file "cafe[picture]", "#{Rails.root}/spec/fixtures/test_cafe2.jpg"
        click_button "更新する"
        expect(page).to have_content "カフェ情報が更新されました！"
        expect(cafe.reload.name).to eq "編集：イカの塩焼き"
        expect(cafe.reload.description).to eq "冬に食べたくなる、身体が温まる料理です"
        expect(cafe.reload.order).to eq "coffee"
        expect(cafe.reload.reference).to eq "henshu-https://cookpad.com/recipe/2798655"
        expect(cafe.reload.popularity).to eq 1
        expect(cafe.reload.picture.url).to include "fixture/test_cafe2.jpg"
      end

      it "無効な更新" do
        fill_in "カフェ名", with: ""
        click_button "更新する"
        expect(page).to have_content 'カフェ名を入力してください'
        expect(cafe.reload.name).not_to eq ""
      end
    end

    context "投稿の削除処理", js: true do
      it "削除成功のフラッシュが表示されること" do
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '投稿が削除されました'
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
        expect(page).to have_link nil, href: cafe_path(cafe), class: 'cafe-picture'
      end
    end

    context "投稿の削除処理", js: true do
      it "削除成功のフラッシュが表示されること" do
        login_for_system(user)
        visit cafe_path(cafe)
        within find('.change-cafe') do
          click_on '削除'
        end
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '投稿が削除されました'
      end
    end

    context "コメントの登録＆削除" do
      it "自分の料理に対するコメントの登録＆削除が正常に完了すること" do
        login_for_system(user)
        visit cafe_path(cafe)
        fill_in "comment_content", with: "今日の味付けは大成功"
        click_button "コメント"
        within find("#comment-#{Comment.last.id}") do
          expect(page).to have_selector 'span', text: user.name
          expect(page).to have_selector 'span', text: '今日の味付けは大成功'
        end
        expect(page).to have_content "コメントを追加しました！"
        click_link "削除", href: comment_path(Comment.last)
        expect(page).not_to have_selector 'span', text: '今日の味付けは大成功'
        expect(page).to have_content "コメントを削除しました"
      end

      it "別ユーザーの料理のコメントには削除リンクが無いこと" do
        login_for_system(other_user)
        visit cafe_path(cafe)
        within find("#comment-#{comment.id}") do
          expect(page).to have_selector 'span', text: user.name
          expect(page).to have_selector 'span', text: comment.content
          expect(page).not_to have_link '削除', href: cafe_path(cafe)
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Cafe, type: :model do
  let!(:cafe_yesterday) { create(:cafe, :yesterday) }
  let!(:cafe_one_week_ago) { create(:cafe, :one_week_ago) }
  let!(:cafe_one_month_ago) { create(:cafe, :one_month_ago) }
  let!(:cafe) { create(:cafe) }

  context "バリデーション" do
    it "有効な状態であること" do
      expect(cafe).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      cafe = build(:cafe, name: nil)
      cafe.valid?
      expect(cafe.errors[:name]).to include("を入力してください")
    end

    it "名前が30文字以内であること" do
      cafe = build(:cafe, name: "あ" * 31)
      cafe.valid?
      expect(cafe.errors[:name]).to include("は30文字以内で入力してください")
    end

    it "説明が140文字以内であること" do
      cafe = build(:cafe, description: "あ" * 141)
      cafe.valid?
      expect(cafe.errors[:description]).to include("は140文字以内で入力してください")
    end

    it "ユーザーIDがなければ無効な状態であること" do
      cafe = build(:cafe, user_id: nil)
      cafe.valid?
      expect(cafe.errors[:user_id]).to include("を入力してください")
    end

    it "人気度が1以上でなければ無効な状態であること" do
      cafe = build(:cafe, popularity: 0)
      cafe.valid?
      expect(cafe.errors[:popularity]).to include("は1以上の値にしてください")
    end

    it "人気度が5以下でなければ無効な状態であること" do
      cafe = build(:cafe, popularity: 6)
      cafe.valid?
      expect(cafe.errors[:popularity]).to include("は5以下の値にしてください")
    end
  end

  context "並び順" do
    it "最も最近の投稿が最初の投稿になっていること" do
      expect(cafe).to eq cafe.first
    end
  end
end

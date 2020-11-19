# ユーザー
User.create!(
    [
      {
        name:  "山田 良子",
        email: "yamada@example.com",
        password:              "foobar",
        password_confirmation: "foobar",
        admin: true,
      },
      {
        name:  "鈴木 恵子",
        email: "suzuki@example.com",
        password:              "password",
        password_confirmation: "password",
      },
      {
        name:  "採用 太郎",
        email: "recruit@example.com",
        password:              "password",
        password_confirmation: "password",
      },
    ]
  )

  # フォロー関係
  user1 = User.find(1)
  user2 = User.find(2)
  user3 = User.find(3)
  user3.follow(user1)
  user3.follow(user2)

  # 料理
  description1 = "冬に食べたくなる、身体が温まる料理です。"
  description2 = "栄養バランスが良いオススメ料理です。"
  description3 = "スピード重視の簡単料理！"

  ## 3ユーザー、それぞれ5料理ずつ作成
  Cafe.create!(
    [
      {
        name: "肉じゃが",
        user_id: 1,
        description: description1,
        reference: "https://cookpad.com/recipe/5905307",
        popularity: 3,
        picture: open("#{Rails.root}/public/images/dish1.jpg"),
        ingredients_attributes: [
                                  { name: "豚ロース肉"},
                                  { name: "じゃがいも"},
                                  { name: "にんじん"},
                                  { name: "玉ねぎ"},
                                  { name: "しょうゆ"},
                                  { name: "みりん"},
                                  { name: "酒"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "ソーセージと卵の炒め物",
        user_id: 2,
        description: description2,
        reference: "https://cookpad.com/recipe/5890533",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/dish2.jpg"),
        ingredients_attributes: [
                                  { name: "ソーセージ"},
                                  { name: "卵"},
                                  { name: "胡椒"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "かに玉",
        user_id: 3,
        description: description3,
        reference: "https://cookpad.com/recipe/5826415",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/dish3.jpg"),
        ingredients_attributes: [
                                  { name: "卵"},
                                  { name: "かに玉の素"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "豚こまの生姜焼き",
        user_id: 1,
        description: description2,
        reference: "https://cookpad.com/recipe/5892456",
        popularity: 3,
        picture: open("#{Rails.root}/public/images/dish4.jpg"),
        ingredients_attributes: [
                                  { name: "豚こま切れ肉"},
                                  { name: "玉ねぎ"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "鶏肉のチーズ照り焼き",
        user_id: 2,
        description: description3,
        reference: "https://cookpad.com/recipe/5878179",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/dish5.jpg"),
        ingredients_attributes: [
                                  { name: "鶏肉"},
                                  { name: "チーズ"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "タンドリーチキン",
        user_id: 3,
        description: description2,
        reference: "https://cookpad.com/recipe/5909869",
        popularity: 3,
        picture: open("#{Rails.root}/public/images/dish6.jpg"),
        ingredients_attributes: [
                                  { name: "鶏胸肉"},
                                  { name: "塩",},
                                  { name: "胡椒"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "鶏肉の味噌照り焼き",
        user_id: 1,
        description: description3,
        reference: "https://cookpad.com/recipe/5899721",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/dish7.jpg"),
        ingredients_attributes: [
                                  { name: "鶏肉"},
                                  { name: "味噌"},
                                  { name: "玉ねぎ"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "豚しゃぶレタス",
        user_id: 2,
        description: description2,
        reference: "https://cookpad.com/recipe/5849961",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/dish8.jpg"),
        ingredients_attributes: [
                                  { name: "レタス"},
                                  { name: "しゃぶしゃぶ用豚肉"},
                                  { name: "三つ葉"},
                                  { name: "胡椒"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "チーズオムレツ",
        user_id: 3,
        description: description3,
        reference: "https://cookpad.com/recipe/5355585",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/dish9.jpg"),
        ingredients_attributes: [
                                  { name: "卵"},
                                  { name: "とろけるチーズ"},
                                  { name: "オリーブオイル"},
                                  { name: "胡椒"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "スペインオムレツ",
        user_id: 1,
        description: description3,
        reference: "https://cookpad.com/recipe/5712829",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/dish10.jpg"),
        ingredients_attributes: [
                                  { name: "卵"},
                                  { name: "じゃがいも"},
                                  { name: "玉ねぎ"},
                                  { name: "胡椒"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "ぶりの照り焼き",
        user_id: 2,
        description: description1,
        reference: "https://cookpad.com/recipe/5628386",
        popularity: 3,
        picture: open("#{Rails.root}/public/images/dish11.jpg"),
        ingredients_attributes: [
                                  { name: "ブリ"},
                                  { name: "しょうゆ"},
                                  { name: "みりん"},
                                  { name: "酒"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "カレーライス",
        user_id: 3,
        description: description1,
        reference: "https://cookpad.com/recipe/4779250",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/dish12.jpg"),
        ingredients_attributes: [
                                  { name: "鶏肉"},
                                  { name: "玉ねぎ"},
                                  { name: "にんじん"},
                                  { name: "じゃがいも"},
                                  { name: "なす"},
                                  { name: "カレールー"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "麻婆豆腐",
        user_id: 1,
        description: description1,
        reference: "https://cookpad.com/recipe/5908616",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/dish13.jpg"),
        ingredients_attributes: [
                                  { name: "牛ひき肉"},
                                  { name: "絹豆腐"},
                                  { name: "麻婆豆腐の素"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "肉豆腐",
        user_id: 2,
        description: description2,
        reference: "https://cookpad.com/recipe/5866590",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/dish14.jpg"),
        ingredients_attributes: [
                                  { name: "大葉"},
                                  { name: "薄切り肉"},
                                  { name: "豆腐"},
                                  { name: "きのこ"},
                                  { name: "しらたき"},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""},
                                  { name: ""}
                                ],
      },
      {
        name: "豚汁",
        user_id: 3,
        description: description1,
        reference: "https://cookpad.com/recipe/5789404",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/dish15.jpg"),
        ingredients_attributes: [
                                  { name: "豚肉"},
                                  { name: "ごぼう"},
                                  { name: "にんじん"},
                                  { name: "大根"},
                                  { name: "こんにゃく"},
                                  { name: "長ネギ"},
                                  { name: "ごま油"},
                                  { name: "味噌"},
                                  { name: "酒"},
                                  { name: "七味唐辛子"}
                                ],
      }
    ]
  )

  cafe3 = Cafe.find(3)
  cafe6 = Cafe.find(6)
  cafe12 = Cafe.find(12)
  cafe13 = Cafe.find(13)
  cafe14 = Cafe.find(14)
  cafe15 = Cafe.find(15)

  # お気に入り登録
  user3.favorite(cafe13)
  user3.favorite(cafe14)
  user1.favorite(cafe15)
  user2.favorite(cafe12)

  # コメント
  cafe15.comments.create(user_id: user1.id, content: "美味しそう！私も食べてみたい！")
  cafe12.comments.create(user_id: user2.id, content: "また作ってー！")

  # 通知
  user3.notifications.create(user_id: user3.id, cafe_id: cafe15.id,
                             from_user_id: user1.id, variety: 1)
  user3.notifications.create(user_id: user3.id, cafe_id: cafe15.id,
                             from_user_id: user1.id, variety: 2, content: "美味しそう！私も食べてみたい！")
  user3.notifications.create(user_id: user3.id, cafe_id: cafe12.id,
                             from_user_id: user2.id, variety: 1)
  user3.notifications.create(user_id: user3.id, cafe_id: cafe12.id,
                             from_user_id: user2.id, variety: 2, content: "また作ってー！")
  # リスト
  user3.list(cafe3)
  user1.list(cafe15)
  user3.list(cafe6)
  user2.list(cafe12)

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
  description1 = "冬に飲みたくなる、身体が温まる飲み物です。"
  description2 = "コーヒーとの相性が良いオススメスイーツです。"
  description3 = "ランチにぴったりの食べ物です！"

  ## 3ユーザー、それぞれ5投稿ずつ作成
  Cafe.create!(
    [
      {
        name: "スターバックスコーヒー",
        user_id: 1,
        order: "ソイラテ",
        description: description1,
        reference: "https://www.starbucks.co.jp/",
        popularity: 3,
        picture: open("#{Rails.root}/public/images/cafe1.jpg"),
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
        name: "DOUTOR",
        user_id: 2,
        order: "カフェ・ラテ",
        description: description1,
        reference: "https://www.doutor.co.jp/dcs/",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/cafe2.jpg"),
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
        name: "コメダ珈琲店",
        user_id: 3,
        order: "コメダブレンド",
        description: description1,
        reference: "http://www.komeda.co.jp/index.php",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/cafe3.jpg"),
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
        name: "サンマルクカフェ",
        user_id: 1,
        order: "抹茶ラテ",
        description: description1,
        reference: "https://www.saint-marc-hd.com/saintmarccafe/",
        popularity: 3,
        picture: open("#{Rails.root}/public/images/cafe4.jpg"),
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
        name: "TULLY'S",
        user_id: 2,
        order: "エスプレッソ",
        description: description1,
        reference: "https://www.tullys.co.jp/",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/cafe5.jpg"),
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
        name: "コメダ珈琲店",
        user_id: 3,
        order: "純栗ぃむ",
        description: description2,
        reference: "http://www.komeda.co.jp/index.php",
        popularity: 3,
        picture: open("#{Rails.root}/public/images/cafe6.jpg"),
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
        name: "サンマルクカフェ",
        user_id: 1,
        order: "デニブラン　キャラメル",
        description: description2,
        reference: "https://www.saint-marc-hd.com/saintmarccafe/",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/cafe7.jpg"),
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
        name: "スターバックスコーヒー",
        user_id: 2,
        order: "あらびきソーセージ＆スクランブルエッグ イングリッシュマフィン",
        description: description3,
        reference: "https://www.starbucks.co.jp/",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/cafe8.jpg"),
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
        name: "TULLY'S",
        user_id: 3,
        order: "小エビのウニトマトクリーム",
        description: description3,
        reference: "https://www.tullys.co.jp/",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/cafe9.jpg"),
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
        name: "DOUTOR",
        user_id: 1,
        order: "安納芋のミルクレープ",
        description: description2,
        reference: "https://www.doutor.co.jp/dcs/",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/cafe10.jpg"),
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
        name: "DOUTOR",
        user_id: 2,
        order: "全粒粉サンド 大豆ミート ～和風トマトのソース～",
        description: description3,
        reference: "https://www.doutor.co.jp/dcs/",
        popularity: 3,
        picture: open("#{Rails.root}/public/images/cafe11.jpg"),
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
        name: "スターバックスコーヒー",
        user_id: 3,
        order: "ニューヨークチーズケーキ",
        description: description2,
        reference: "https://www.starbucks.co.jp/",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/cafe12.jpg"),
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
        name: "サンマルクカフェ",
        user_id: 1,
        order: "もっちりサンド　フレッシュ野菜アボガド",
        description: description3,
        reference: "https://www.saint-marc-hd.com/saintmarccafe/",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/cafe13.jpg"),
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
        name: "コメダ珈琲店",
        user_id: 2,
        order: "ハムサンド",
        description: description3,
        reference: "http://www.komeda.co.jp/index.php",
        popularity: 4,
        picture: open("#{Rails.root}/public/images/cafe14.jpg"),
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
        name: "TULLY'S",
        user_id: 3,
        order: "クラシックパンケーキ メープルバター",
        description: description2,
        reference: "https://www.tullys.co.jp/",
        popularity: 5,
        picture: open("#{Rails.root}/public/images/cafe15.jpg"),
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

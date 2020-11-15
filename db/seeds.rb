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

  # カフェ
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
                                  { name: "平塚"}
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
                                  { name: "海老名"}
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
                                  { name: "平塚"}
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
                                  { name: "横浜"}
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
                                  { name: "丸の内"}
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
                                  { name: "鎌倉"}
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
                                  { name: "戸塚"}
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
                                  { name: "渋谷"}
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
                                  { name: "新宿"}
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
                                  { name: "藤沢"}
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
                                  { name: "伊勢原"}
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
                                  { name: "茅ヶ崎"}                                ],
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
                                  { name: "辻堂"}
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
                                  { name: "大船"}
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
                                  { name: "川崎"}
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
  cafe12.comments.create(user_id: user2.id, content: "今度一緒に行こう！")

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

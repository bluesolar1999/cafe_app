require 'csv'

CSV.generate do |csv|
  # 1行目にラベルを追加
  csv_column_labels = %w(名前 注文したもの 説明 投稿した人 参照URL\
                         人気度 最初に投稿した日時\
                         駅1の名前 駅2の名前\
                         駅3の名前 駅4の名前\
                         駅5の名前 駅6の名前\
                         駅7の名前 駅8の名前\
                         駅9の名前 駅10の名前)
  csv << csv_column_labels
  # 各投稿のカラム値を追加
  current_user.feed.each do |cafe|
    # まず駅以外のカラムを追加
    csv_column_values = [
      cafe.name,
      cafe.order,
      cafe.description,
      cafe.user.name,
      cafe.reference,
      cafe.popularity,
      cafe.created_at.strftime("%Y/%m/%d(%a)")
    ]
    # 駅の数(number_of_ingredients)を特定
    # 初期値を9にしておき、nameが空の駅が見つかったらその配列番号に置き換える
    number_of_ingredients = 9
    cafe.ingredients.each_with_index do |ing, index|
      if ing.name.empty?
        number_of_ingredients = index
        break
      end
    end
    # 駅の数だけカラムを追加する
    i = 0
    while i <= number_of_ingredients
      csv_column_values.push(cafe.ingredients[i].name)
      i += 1
    end
    # 最終的なcsv_column_valuesをcsvのセルに追加
    csv << csv_column_values
  end
end

require 'csv'

CSV.generate do |csv|
  # 1行目にラベルを追加
  csv_column_labels = %w(名前 注文したもの 説明 投稿した人 参照URL\
                         人気度 最寄り駅 最初に投稿した日時)
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
      cafe.ingredients[i].name,
      cafe.created_at.strftime("%Y/%m/%d(%a)")
    ]
    # 最終的なcsv_column_valuesをcsvのセルに追加
    csv << csv_column_values
  end
end

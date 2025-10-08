


# くじのシミュレーションを行うメソッド
# @param n [Integer] 試行回数
# @param win_probability [Float] 当選確率
# @return [Integer] 当選回数
def lottery_simulation(n, win_probability)
  win_count = 0
  # n回ループを繰り返す
  n.times do
    # 0.0以上1.0未満のランダムな浮動小数点数を生成
    if rand < win_probability
      win_count += 1
    end
  end
  return win_count
end

#--- メイン処理 ---

# 1. 基本設定
WIN_PROBABILITY = 0.12 # 4.38%

# 2. ユーザーからの試行回数の入力
#print "くじを引く回数 (N) を入力してください: "
input_trials = 5
num_trials = input_trials.to_i

# 3. 入力値が正の整数であるかチェック
if num_trials <= 0
  puts "エラー: 1以上の有効な整数を入力してください。"
  exit 1
end

kaisu = 50
win_count_summary = Hash.new(0)

kaisu.times do

    # 4. シミュレーションの実行
    #puts "シミュレーションを実行中..."
    wins = lottery_simulation(num_trials, WIN_PROBABILITY)

    # 5. 実際の結果の確率を計算
    # どちらかの数値を.to_fで浮動小数点数にしないと整数除算になるので注意
    actual_probability = (wins.to_f / num_trials) * 100

    # 6. 結果を表示
    #puts ""
    #puts "--- 抽選結果 ---"
    puts "試行回数:当選回数: #{num_trials} : #{wins}"
    #printf "理論上の当選確率: %.2f%%\n", WIN_PROBABILITY * 100
    #printf "実際の結果の確率: %.4f%%\n", actual_probability

    # 当選回数を集計
    win_count_summary[wins] += 1

end

# 7. 当選確率を表示
puts ""
printf "理論上の当選確率: %.2f%%\n", WIN_PROBABILITY * 100

# 8. 当選回数ごとの集計を表示
puts ""
puts "--- 当選回数ごとの集計 ---"
win_count_summary.keys.sort.each do |wins|
  count = win_count_summary[wins]
  percentage = (count.to_f / kaisu) * 100
  printf "当選回数 %d回: %d回 (%.1f%%)\n", wins, count, percentage
end

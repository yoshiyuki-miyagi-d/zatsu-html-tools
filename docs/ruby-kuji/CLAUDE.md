# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

くじ引きのシミュレーションプログラム。指定した当選確率と試行回数で、モンテカルロシミュレーションを実行して当選回数の分布を表示する。

2つの実装が存在する:
- `kuji.rb`: Rubyによるコマンドライン版
- `kuji.html`: JavaScriptによるWeb版(スタンドアロンHTML)

## 実行方法

### Ruby版
```bash
ruby kuji.rb
```

### HTML版
ブラウザで `kuji.html` を直接開く。

## コードの構造

### Ruby版 (kuji.rb)
- `lottery_simulation(n, win_probability)`: n回の試行を実行し、当選回数を返す
- メイン処理: シミュレーションを複数回実行し、当選回数の分布を集計・表示

### HTML版 (kuji.html)
- `lotterySimulation(n, winProbability)`: Ruby版と同等の処理をJavaScriptで実装
- `runSimulation()`: UI入力を取得し、シミュレーションを実行して結果を表示
- 当選確率、試行回数、シミュレーション実行回数をWebフォームで設定可能

## パラメータ

両実装とも以下のパラメータを使用:
- 当選確率: くじ1回あたりの当選確率
- 試行回数: 1回のシミュレーションでくじを引く回数
- シミュレーション実行回数: 統計データ収集のために何回シミュレーションを繰り返すか

## 出力内容

1. 各試行の結果(試行回数と当選回数)
2. 理論上の当選確率
3. 当選回数ごとの集計(出現回数と割合)
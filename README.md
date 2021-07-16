# README

# okr-intern
インターン生のOKR管理

## Dependency
* Ruby 2.7.1
* Rails 6.0.3
* Bootstrap
* MySQL 5.7
* Docker
* AWS(EC2)

## アカウント
admin権限

ゲストログイン
* Email: test@gmail.com
* Password: test00

okr-intern : http://www.okr-intern.xyz/

* 本来はgoogle認証のみですが、ゲストログインのためにログイン画面を追加しています
* google認証は社内のみの権限にしています

## Usage
```
$ docker-compose build
$ docker-compose run web bundle i
$ docker-compose run web rails db:create
$ docker-compose run web rails db:seed
$ docker-compose up     // http://localhost:3001
$ docker-compose down
```

## 機能
* ログイン
* 会員登録
* ユーザー登録
* セクションOKR, 個人OKR　（作成、編集、削除)
* 投票機能(quarterが終わり次第、自動で結果を集計し通知するように)
* OKR並び替え機能
* 月ごとのコメント
* slack通知機能
* admin権限
```
セクションOKRの編集は全インターン生が可能
個人OKRの編集は個人+マスタ権限者が可能
投票ページは自分の投票のみ。マスタ権限は全投票閲覧可能
```

## こだわりポイント
* DB設計では、同じようなテーブルが存在していたので、ポリモーフィック関連を用いたり、外部キーを貼ったりとアンチパターンにならないように
* インターン生のモチベーションを上げるという目的で投票機能を実装(自動で集計して、slackで通知される)
* section_okrに並び替え機能を実装
* ユーザーヒアリングを実施しながら、実装を進めたこと
* quarterごとの表示になるように
* viewでのロジックをhelperやdecoratorに移行するようにした
* 入力ミスを減らすためのバリデーションを各所入れた
  * 1quarterに複数登録できない、コメントを同じ月に複数登録できないように
  * 各KRのポイントは1.0以上、少数第2以下を登録できないように対応
  * OKRのO、KRを必須入力になど

## 反省点
* 既にあったスプレッドシートのUIを踏襲して作ったが使いずらい
* 画面のデザインがない状態だったので、簡単にFigmaなどを使ってmockを作って相談するというのも良かったように思う

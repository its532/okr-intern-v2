# README

# okr-intern
インターン生のOKR管理

## Dependency
* Ruby 2.7.1
* Rails 6.0.3
* Bootstrap
* MySQL 5.7
* Docker

## アカウント
admin権限
* forstaのemailでログインいただければ、寺田さん、戸村さんはadmin権限になるはずです

念の為、ゲストログインでも可能です
* Email: test@gmail.com
* Password: test00

okr-intern : http://www.okr-intern.xyz/

* ログアウト機能は削除予定ですが、念の為確認用に置いています
* ログイン画面もゲストログインのため入力欄残していますが、google認証のみにする予定です

## Usage
```
$ docker-compose build
$ docker-compose run web bundle i
$ docker-compose run web rails db:create
$ docker-compose run web rails db:seed
$ docker-compose up     // http://localhost:3001
$ docker-compose down
```

## FBに対する改善
* セクション名の新規追加、編集、削除機能を追加
  * admin権限でしか表示されないように
* quarterの任意追加に関しては、年とquarterのカラムを別にすることで任意のquarterでのokr作成を可能にした。
* 各KRのポイントは1.0以上、少数第2以下を登録できないように対応
* OKRとコメントを一ページで閲覧可能に
* 登録ボタンと見え方が一緒で混乱を招く指摘に対しては、タイトルを表示することでどのページのボタンかわかるように
* OKRのO、KRを必須入力に
* コメントを同じQ、同じ月で2度登録できないようバリデーションをかけた
* Userテーブルに入社日カラムを追加
* 表示されるOKRがいつのQか分からない指摘に対しては、viewのテーブルにquarter欄を追加すること対応
* セクションOKR、同じQ内での複数登録できないようバリデーションをかけた
* 個人OKR,入社日が若いメンバーから表示させれるように
* DB構成に関しては、ポリモーフィック関連を用いることで正規化。(key_resultテーブル)
* コミットメッセージを入れるようにした
* Section Okrに対して、投票機能を実装。quarterが終わり次第、バッチ処理でsalck通知にて投票が一番多いsectionを通知。各ユーザーのコメントもslackで通知させるようにした。
  * 投稿一覧画面では自分の投票を閲覧可能。(編集、削除可能)　admin権限は全投票を閲覧可能。
* 今回はawsのec2にデプロイした(DB: MySQL, サーバー：Nginx)
* Capistranoでの自動デプロイ(途中まで動いていたのですが、直前で動かなくなりました、、)

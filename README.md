# Karaoke Graph
カラオケの点数を記録するWebサービス
## セットアップ
1. `bundle install`
1. `rails db:migrate`
1. `rails db:seed`
## テスト
`bundle exec rails t`
## コード整形
`bundle exec rubocop -A`
## herokuへのpush手順
1. `git push heroku master`
1. `heroku run rake db:migrate`

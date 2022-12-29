# herokuへのpush手順
1. git push heroku master
1. heroku run rake db:migrate(migrateファイルを更新した場合)

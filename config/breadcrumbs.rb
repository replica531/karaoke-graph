# frozen_string_literal: true

crumb :root do
  link 'ホーム', root_path
end

crumb :help do
  link 'Help', help_path
end

crumb :about do
  link 'About', about_path
end

crumb :contact do
  link 'Contact', contact_path
end

crumb :users do
  link 'ユーザー一覧', users_path
  parent :root
end

crumb :user do |_user|
  if params[:controller] == 'users'
    link 'プロフィール', user_path(id: params[:id])
  else
    link 'プロフィール', user_path(id: params[:user_id])
  end
  parent :root
end

crumb :user_new do
  link 'アカウント登録', new_user_path
  parent :root
end

crumb :user_edit do |user|
  link 'アカウント編集', edit_user_path
  parent :user, user
end

crumb :tunes do
  link '曲一覧', user_tunes_path
  parent :root, user_path(params[:user_id])
end

crumb :tune do |tune|
  if params[:controller] == 'tunes'
    link tune.title, user_tune_path(id: params[:id])
  else
    link Tune.find(params[:tune_id]).title, user_tune_path(id: params[:tune_id])
  end
  parent :tunes
end

crumb :tune_new do
  link '曲登録', new_user_tune_path
  parent :tunes
end

crumb :tune_edit do |tune|
  link '曲情報編集', edit_user_tune_path
  parent :tune, tune
end

crumb :results do
  link '記録一覧', user_tune_results_path
  parent :tune, user_tune_path(id: params[:tune_id])
end

crumb :result do |result|
  if params[:controller] == 'results'
    link result.datetime.strftime('%F %H:%M'), user_tune_result_path(id: params[:id])
  else
    link Result.find(params[:result_id]).datetime.strftime('%F %H:%M'), user_tune_result_path(id: params[:result_id])
  end
  parent :results, user_tune_path(id: params[:tune_id])
end

crumb :result_new do
  link '記録', new_user_tune_result_path
  parent :results
end

crumb :result_edit do |result|
  link '記録編集', edit_user_tune_result_path
  parent :result, result
end

crumb :logs do
  link '歌唱履歴', user_logs_path
  parent :user
end

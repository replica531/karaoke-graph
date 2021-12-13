crumb :root do
  link "ホーム", root_path
end

crumb :help do
  link "Help", help_path
end

crumb :about do
  link "About", about_path
end

crumb :contact do
  link "Contact", contact_path
end

crumb :users do
  link "ユーザー一覧", users_path
  parent :root
end

crumb :user do |user|
  if params[:controller] == 'users'
    link "プロフィール", user_path(id: params[:id])
  else
    link "プロフィール", user_path(id: params[:user_id])
  end
  parent :root
end

crumb :user_new do
  link "アカウント登録", new_user_path
  parent :root
end

crumb :user_edit do |user|
  link "アカウント編集", edit_user_path
  parent :user, user
end

crumb :musics do
  link "曲一覧", user_musics_path
  parent :user, user_path(params[:user_id])
end

crumb :music do |music|
  if params[:controller] == 'musics'
    link music.title, user_music_path(id: params[:id])
  else
    link Music.find(params[:music_id]).title, user_music_path(id: params[:music_id])
  end
  parent :musics
end

crumb :music_new do
  link "曲登録", new_user_music_path
  parent :musics
end

crumb :music_edit do |music|
  link "曲情報編集", edit_user_music_path
  parent :music, music
end

crumb :results do
  link "記録一覧", user_music_results_path
  parent :music, user_music_path(id: params[:music_id])
end

crumb :result do |result|
  if params[:controller] == 'results'
    link result.datetime.strftime("%F %H:%M"), user_music_result_path(id: params[:id])
  else
    link Result.find(params[:result_id]).datetime.strftime("%F %H:%M"), user_music_result_path(id: params[:result_id])
  end
  parent :results, user_music_path(id: params[:music_id])
end

crumb :result_new do
  link "記録", new_user_music_result_path
  parent :results
end

crumb :result_edit do |result|
  link "記録編集", edit_user_music_result_path
  parent :result, result
end

# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = 'アカウントが有効化されていません'
        message += 'メールに記載されている有効化のためのリンクをクリックしてください'
        message += '(メールが届かない場合は迷惑メールフォルダもご確認ください)'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = '無効なEメールとパスワードの組み合わせです'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

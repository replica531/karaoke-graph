class LogsController < ApplicationController
  def index
    logs = Result.where(user_id: current_user.id).order(updated_at: 'DESC')
    @logs = Kaminari.paginate_array(logs).page(params[:page]).per(20)
  end
end

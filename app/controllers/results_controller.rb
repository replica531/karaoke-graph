class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  def index
    @music = Music.find(params[:music_id])
    @results = Result.where(music_id: params[:music_id]).all
  end

  def show
  end

  def new
    @result = Result.new
    @result.datetime = Time.now.strftime("%Y%m%dT%H%M").to_time
  end

  def edit
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to user_music_results_path
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @result.update(result_params)
        redirect_to user_music_results_path
      else
        render :edit
      end
    end
  end

  def destroy
    @result.destroy
    redirect_to user_music_results_path
  end

  private
    def set_result
      @result = Result.find(params[:id])
    end

    def result_params
      params.require(:result).permit(:score, :memo, :datetime, :music_id)
    end
end

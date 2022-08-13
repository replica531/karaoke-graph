# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :set_result, only: %i[show edit update destroy]

  def index
    @music = Music.find(params[:music_id])
    @results = @music.results.all.order(datetime: 'DESC')
  end

  def show; end

  def new
    @score_value = 80
    @music = Music.find(params[:music_id])
    @result = Result.new
    @result.datetime = Time.now.strftime('%Y%m%dT%H%M').to_time
  end

  def edit
    @score_value = @result.score
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      current_user.update_attributes(default_model: @result.model)
      redirect_to user_music_results_path
    else
      redirect_to new_user_music_result_path, alert: @result.errors.full_messages.join(', ')
    end
  end

  def update
    if @result.update(result_params)
      redirect_to user_music_result_path(user_id: current_user, id: @result)
    else
      redirect_to edit_user_music_result_path, alert: @result.errors.full_messages.join(', ')
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
    params.require(:result).permit(:model, :key, :score, :memo, :datetime, :music_id, :user_id)
  end
end

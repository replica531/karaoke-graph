# frozen_string_literal: true

class MusicsController < ApplicationController
  before_action :set_music, only: %i[show edit update destroy]
  before_action :set_artists, only: %i[index new create edit update]

  def index
    @sort = {
      "平均点": 'average_score',
      "歌唱回数": 'results.length'
    }
    scope = current_user.musics.all.eager_load(:results).order(:artist).order(:title)
    scope = scope.where('title LIKE ?', "%#{params[:title]}%") if params[:title].present?
    scope = scope.where('artist LIKE ?', "%#{params[:artist]}%") if params[:artist].present?
    if params[:sort].present?
      scope = scope.sort_by(&:average_score).reverse if params[:sort] == 'average_score'
      scope = scope.sort_by { |s| s.results.length }.reverse if params[:sort] == 'results.length'
    end
    scope = scope.where(favorite: true) if params[:favorite]
    @musics = scope.page(params[:page]).per(20)
    @titles = current_user.musics.pluck(:title).uniq
  end

  def show
    @results = @music.results.order(datetime: 'DESC').limit(10).reverse
    @results.each do |result|
      result.datetime.strftime('F')
    end
    # グラフの縦の範囲を決める
    @y_min = 101
    @y_max = -1
    if @music.results.present?
      @results.each do |result|
        @y_min = [@y_min, result.score - 5].min
        @y_max = [@y_max, result.score + 5].max
      end
    end
    @y_min = [0, @y_min].max
    @y_max = [100, @y_max].min
  end

  def new
    @music = Music.new
  end

  def edit; end

  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id
    if @music.save
      redirect_to user_musics_path
    else
      render :new
    end
  end

  def update
    if @music.update(music_params)
      redirect_to user_music_path(user_id: current_user, id: @music)
    else
      render :edit
    end
  end

  def destroy
    @music.destroy
    redirect_to user_musics_path
  end

  private

  def set_music
    @music = Music.find(params[:id])
  end

  def set_artists
    @artists = current_user.musics.pluck(:artist).uniq
  end

  def music_params
    params.require(:music).permit(:title, :artist, :key, :memo, :favorite, :user_id)
  end
end

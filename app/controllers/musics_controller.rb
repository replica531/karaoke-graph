class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :edit, :update, :destroy]
  before_action :set_artists, only: [:new, :create, :edit, :update]

  def index
    @musics = current_user.musics.all.order(:artist).order(:title)
  end

  def show
    @results = @music.results.order(datetime: "DESC").limit(10).reverse
    @results.each do |result|
      result.datetime.strftime("F")
    end
    #グラフの縦の範囲を決める
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

  def edit
  end

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
    respond_to do |format|
      if @music.update(music_params)
        redirect_to user_musics_path
      else
        render :edit
      end
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
      params.require(:music).permit(:title, :artist, :user_id)
    end
end

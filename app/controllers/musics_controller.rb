class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :edit, :update, :destroy]

  def index
    @musics = current_user.musics.all
  end

  def show
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

    def music_params
      params.require(:music).permit(:title, :artist, :user_id)
    end
end

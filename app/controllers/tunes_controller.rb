# frozen_string_literal: true

class TunesController < ApplicationController
  before_action :set_tune, only: %i[show edit update destroy]
  before_action :set_artists, only: %i[index new create edit update]

  def index
    @sort = {
      "平均点": 'average_score',
      "歌唱回数": 'results.length'
    }
    scope = current_user.tunes.all.eager_load(:results).order(:artist).order(:title)
    scope = scope.where('title LIKE ?', "%#{params[:title]}%") if params[:title].present?
    scope = scope.where('artist LIKE ?', "%#{params[:artist]}%") if params[:artist].present?
    if params[:sort].present?
      scope = scope.sort_by(&:average_score).reverse if params[:sort] == 'average_score'
      scope = scope.sort_by { |s| s.results.length }.reverse if params[:sort] == 'results.length'
    end
    scope = scope.where(favorite: true) if params[:favorite]
    @tunes = Kaminari.paginate_array(scope).page(params[:page]).per(20)
    @titles = current_user.tunes.pluck(:title).uniq
  end

  def show
    @results = @tune.results.order(datetime: 'DESC').limit(10).reverse
    @results.each do |result|
      result.datetime.strftime('F')
    end
    # グラフの縦の範囲を決める
    @y_min = 101
    @y_max = -1
    if @tune.results.present?
      @results.each do |result|
        @y_min = [@y_min, result.score - 5].min
        @y_max = [@y_max, result.score + 5].max
      end
    end
    @y_min = [0, @y_min].max
    @y_max = [100, @y_max].min
    Genius.access_token = ENV['GENIUS_ACCESS_TOKEN']
    Genius.text_format = "html"
    songs = Genius::Song.search("The Hills") # Returns an array of Song objects
    the_hills = songs.first
    the_hills.title # => "The Hills"
    @test = the_hills.primary_artist.name # => "The Weeknd"
  end

  def new
    @tune = Tune.new
  end

  def edit; end

  def create
    @tune = Tune.new(tune_params)
    @tune.user_id = current_user.id
    if @tune.save
      redirect_to user_tunes_path
    else
      redirect_to new_user_tune_path, alert: @tune.errors.full_messages.join(', ')
    end
  end

  def update
    if @tune.update(tune_params)
      redirect_to user_tune_path(user_id: current_user, id: @tune)
    else
      redirect_to edit_user_tune_path, alert: @tune.errors.full_messages.join(', ')
    end
  end

  def destroy
    @tune.destroy
    redirect_to user_tunes_path
  end

  private

  def set_tune
    @tune = Tune.find(params[:id])
  end

  def set_artists
    @artists = current_user.tunes.pluck(:artist).uniq
  end

  def tune_params
    params.require(:tune).permit(:title, :artist, :key, :memo, :favorite, :user_id)
  end
end

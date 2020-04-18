# ArtistsController.new

class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update destroy]

  def index
    @artists = Artist.all

    @artist = if params[:artist_id].present?
                Artist.find(params[:artist_id])
              else
                @artists.first
              end
  end

  def show
    @album = Album.new
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy

    redirect_to artists_path
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  # strong params
  def artist_params
    params.require(:artist).permit(:name)
  end
end

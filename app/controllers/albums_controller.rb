class AlbumsController < ApplicationController
  before_action :set_artist, only: %i[new create]

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.artist = @artist

    if @album.save
      request.xhr? ? render_album : redirect_to(@artist)
    else
      request.xhr? ? render_form : render(:new)
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to @album.artist
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def album_params
    params.require(:album).permit(:title, :image_url)
  end

  def render_form
    render partial: 'albums/form'
  end

  def render_album
    render @album
  end
end

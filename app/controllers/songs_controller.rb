class SongsController < ApplicationController

  def index
    @songs = current_user.songs.all
    session[:hit_counter] ||= 0
    session[:hit_counter] += 1 
  end

  def show
    @song = current_user.songs.find(params[:id])
  end

  def new
    @song = current_user.songs.new
  end

  def create
    @song = current_user.songs.new(song_params)
    if @song.save
      flash[:success] = "Song was successfully created!"
      # redirect to the song path with the song id (pass in the song)
      redirect_to user_path(current_user)
    else
      # song hasn't been saved in database, go back to the form
      flash[:error] = @song.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @song = current_user.songs.find(params[:id])
  end

  def destroy
    @song = current_user.songs.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  def update
    @song = current_user.songs.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def all
    current_user.songs.each do |song|
      song.destroy
    end
    redirect_to user_path(current_user)
    flash[:notice] = "Your shit is gone"
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
class SongsController < ApplicationController

	def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
		@song.user_id = current_user.id
		if @song.save
			redirect_to songs_path, notice: "投稿完了！"
		else
			render "new"
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

	def song_params
		params.require(:song).permit(:title, :artist_name, :body)
	end
	
end

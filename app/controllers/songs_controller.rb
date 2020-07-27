class SongsController < ApplicationController

	def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
		@comment = Comment.new
		@comments = @song.comments
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
		@song.user_id = current_user.id
		if @song.save
			redirect_to songs_path, notice: "投稿完了しました！"
		else
			render "new"
		end
	end

	def edit
		@song = Song.find(params[:id])
		if @song.user_id != current_user.id
			redirect_to songs_path
		end
	end

	def update
		@song = Song.find(params[:id])
		@song.update(song_params)
		redirect_to song_path(@song.id), notice: "編集を保存しました。"
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy
		redirect_to songs_path, notice: "投稿を削除しました。"
	end

	private

	def song_params
		params.require(:song).permit(:title, :artist_name, :body)
	end
	
end

class CommentsController < ApplicationController

	def create
		song = Song.find(params[:song_id])
		@comment = song.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to song_path(song), notice: "コメントを投稿しました。"
	end

	def destroy
		song = Song.find(params[:song_id])
		@comment = song.comments.find(params[:id])
		@comment.destroy
		redirect_to song_path(params[:song_id]), notice: "コメントを削除しました。"
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end

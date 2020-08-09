class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		@song = Song.find(params[:song_id])
		favorite = @song.favorites.new(user_id: current_user.id)
		favorite.save
		# redirect_to request.referer
		@song.create_notification_favorite!(current_user) # 通知機能の記述
	end

	def destroy
		@song = Song.find(params[:song_id])
		favorite = current_user.favorites.find_by(song_id: @song.id)
		favorite.destroy
		# redirect_to request.referer
	end
end

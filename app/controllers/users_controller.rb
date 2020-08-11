class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:new_guest]
	
	def index
		@user = current_user
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@songs = @user.songs
	end

	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(current_user.id)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: "変更を保存しました。"
		else
			render "edit"
		end
	end

	def followings
		@user = User.find(params[:id])
		@users = @user.followings
		render "show_follow"
	end

	def followers
		@user = User.find(params[:id])
		@users = @user.followers
		render "show_follower"
	end

	def favorites
		@user = User.find(params[:id])
		@users = @user.favorites
		render "show_favorites"
	end

	def search
		@user = User.search(params[:keyword])
	end

	def new_guest
		user = User.find_or_create_by!(name: "ゲスト", email: "guest@example.com") do |user|
			user.password = SecureRandom.urlsafe_base64
		end
		sign_in user
		redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
	end
	
	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end

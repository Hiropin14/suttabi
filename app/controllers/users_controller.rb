class UsersController < ApplicationController

    def show
        @user = User.find(params[:id]) 
        @spots = @user.spots

        favorites = Favorite.where(user_id: current_user.id).pluck(:spot_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
        @favorite_list = Spot.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
    end

end

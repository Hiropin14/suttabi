class UsersController < ApplicationController

    def show
        @user = User.find(params[:id]) 
        @posts = @user.posts

        favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
        @favorite_list = Post.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
    end

end

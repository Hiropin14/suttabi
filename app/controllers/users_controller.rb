class UsersController < ApplicationController

    def show
        @user = User.find(params[:id]) 
        @spots = @user.spots.order("created_at DESC")
        @relationship = current_user.relationships.find_by(follow_id: @user.id)  
        @set_relationship = current_user.relationships.new
        @likes = Like.where(user_id: @user.id)
       
       
    end

    def map
        # respond_to以下の記述によって、
        # remote: trueのアクセスに対して、
        # map.js.erbが変えるようになります。
        respond_to do |format|
          format.js
        end
      end

end

class LikesController < ApplicationController

    def create
        @spot = Spot.find(params[:spot_id])
        like = current_user.likes.create(spot_id: params[:spot_id]) #user_idとtweet_idの二つを代入
        
    end
    
    def destroy
        @spot = Spot.find(params[:spot_id])
        like = Like.find_by(spot_id: params[:spot_id], user_id: current_user.id)
        like.destroy
        
    end
    
    
end

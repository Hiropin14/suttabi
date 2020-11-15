class UsersController < ApplicationController

    def show
        @user = User.find(params[:id]) 
        @spots = @user.spots.order("created_at DESC")
        @relationship = current_user.relationships.find_by(follow_id: @user.id)  
        @set_relationship = current_user.relationships.new
        @likes = Like.where(user_id: @user.id)
        #userがいいねしたもの（spot_id(番号）であってspotレコードではない）
        
        @spot_lists = Spotlist.all
        @hash = Gmaps4rails.build_markers(@spot_lists) do |spot_list, marker|
          marker.lat spot_list.latitude
          marker.lng spot_list.longitude
          marker.infowindow render_to_string( partial: "map/infowindow",
                                              locals: {spot_list:spot_list} )
        end
       
        array = []
        @likes.each do |like|
            array.push like.spot
        end 
        
        array2 = []
        array.each do |spot|
          array2.push spot.address  
        end

        gon.liked_addresses = array2
    end

end

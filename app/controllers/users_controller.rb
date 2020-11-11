class UsersController < ApplicationController

    def show
        @user = User.find(params[:id]) 
        @spots = @user.spots.order("created_at DESC")
        @relationship = current_user.relationships.find_by(follow_id: @user.id)  
        @set_relationship = current_user.relationships.new
        @likes = Like.where(user_id: @user.id)
       
        @spot_lists = Spotlist.all
        @hash = Gmaps4rails.build_markers(@spot_lists) do |spot_list, marker|
          marker.lat spot_list.latitude
          marker.lng spot_list.longitude
          marker.infowindow render_to_string( partial: "map/infowindow",
                                              locals: {spot_list:spot_list} )
        end
       
    end

end

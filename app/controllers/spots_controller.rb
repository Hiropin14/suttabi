class SpotsController < ApplicationController
  before_action :authenticate_user!

  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def show
    @spot = Spot.find(params[:id])
   
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to :action => "show", :id => @spot.id
    else
      redirect_to :action => "new"
    end
  end


  def create
    spot = Spot.new(spot_params)
    spot.user_id = current_user.id

    if spot.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    Spot.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
  def spot_params
    params.require(:spot).permit(:about, :image)
  end

end

class SpotsController < ApplicationController
  before_action :authenticate_user!

  def index
    @spots = Spot.all

    if params[:search] == nil
      @spots= Spot.all
    elsif params[:search] == ''
      @spots= Spot.all
    else
      #部分検索
      @spots = Spot.where("about or address LIKE ? ",'%' + params[:search] + '%')
    end
    
  end

  def new
    @spot = Spot.new
  end

  def show
    @spot = Spot.find(params[:id])

    # @spots = Spot.all
    # @hash = Gmaps4rails.build_markers(@spots) do |place, marker|
    #   marker.lat place.latitude
    #   marker.lng place.longitude
    #   marker.infowindow render_to_string( partial: "map/infowindow",
    #                                       locals: {place:place} )
    # end

   gon.address = @spot.address
     # 左辺にはgon.〇〇〇という形式で変数の名前を記入する。(頭にgon!!)
      # この名前を使ってJavascriptファイルから変数を呼び出す。
      # 右辺には代入したいオブジェクト(値)を記入する。
   
  end

  def map
    # respond_to以下の記述によって、
    # remote: trueのアクセスに対して、
    # map.js.erbが変えるようになります。
    respond_to do |format|
      format.js
    end
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
    params.require(:spot).permit(:about, :image, :address)
  end

end

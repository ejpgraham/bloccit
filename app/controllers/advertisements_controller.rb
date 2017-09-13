class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:body]
    @advertisement.price = params[:advertisement][:price]
    p @advertisement
    if @advertisement.save
      flash[:notice] = "This ad is fine"
      redirect_to @advertisement
    else
      flash[:notice] = "This ad is bad. It's a bad ad."
      render :new
    end
  end
end

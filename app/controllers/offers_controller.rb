class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @transaction = Transaction.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offer_path(@offer.offer), status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:number, :player_name, :team, :description, :photo)
  end

end

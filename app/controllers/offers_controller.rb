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
    @offer = Offer.new(offer_params_new)
    @offer.user = current_user

    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update(offer_params_edit)
      redirect_to offer_path(@offer)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to my_offers_path, status: :see_other
  end

  def my
    @offers = current_user.offers
  end

  private

  def offer_params_edit
    params.require(:offer).permit(:description)
  end

  def offer_params_new
    params.require(:offer).permit(:number, :player_name, :special, :team, :description, :photo, :user_id)
  end
end

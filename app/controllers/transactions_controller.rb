class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @transaction = Transaction.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    seller = @offer.user
    buyer = current_user
    @transaction = Transaction.new(transaction_params)
    @transaction.seller = seller
    @transaction.buyer = buyer
    @transaction.seller_card = @offer
    #Por default a transação não foi aceita: Accepted é false.

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

  def transaction_params
    params.require(:transaction).permit(:buyer_card_id)
  end

end

class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
    raise
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @transaction = Transaction.new
  end

  def create
    # É necessário qual offer está sendo criada uma transaction
    @offer = Offer.find(params[:offer_id])
    # Com o ID da offer, sabe-se quem é o user(seller)
    seller = @offer.user
    # O current user será outro usuário logado. O valor de current_user vem de devise
    buyer = current_user
    @transaction = Transaction.new(transaction_params)
    # Atribui-se seller e buyer a transaction
    @transaction.seller = seller
    @transaction.buyer = buyer
    # Na transaction deve constar o card que está sendo "vendido".
    @transaction.seller_card = @offer
    # Por default a transação não foi aceita: Accepted é false.

    if @transaction.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to offer_path(@offer.offer), status: :see_other
  end

  private

  def transaction_params
    params.require(:transaction).permit(:buyer_card_id, :accepted)
  end

end

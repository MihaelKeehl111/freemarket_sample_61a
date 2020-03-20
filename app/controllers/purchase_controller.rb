class PurchaseController < ApplicationController
  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    @product = Product.find(params[:id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card = customer.cards.retrieve(card.card_id)
    @exp_month = @card.exp_month.to_s
    @exp_year = @card.exp_year.to_s.slice(2,3)
  end

  def done

  end
end

class HomeController < ApplicationController
  def index
  end

  def exchange
    value = Currency.exchange(params[:currency], params[:currency_destination], params[:quantity]).to_f
    render json: { value: value }
  end


  def send_email
    ExchangeMailer.send_currency_exchange(exchange_result_params).deliver_now!
  end


  private


  def exchange_result_params
    params.permit(:email, :currency, :currency_destination, :quantity, :result)
  end
end

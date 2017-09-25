class HomeController < ApplicationController
  def index
  end

  def exchange
    value = Currency.exchange(params[:currency], params[:currency_destionation], params[:quantity]).to_f
    render json: { value: value }
  end
end

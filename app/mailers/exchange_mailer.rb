class ExchangeMailer < ApplicationMailer
  
  def send_currency_exchange(options)
    @currency = options[:currency] 
    @currency_destination = options[:currency_destination]
    @quantity = options[:quantity]
    @result = options[:result]

    mail(to: options[:email], subject: "Conversão solicitada!")
  end

end

# Preview all emails at http://localhost:3000/rails/mailers/exchange
class ExchangePreview < ActionMailer::Preview
  def exchange_mail
    options = {
      email: "teste@teste.com",
      currency: "BRL",
      currency_destination: "EUR",
      quantity: 10,
      result: 32.12
    }
    
    ExchangeMailer.send_currency_exchange(options)
  end
end

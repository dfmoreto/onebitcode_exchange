Rails.application.routes.draw do
  root "home#index"
  post "exchange", to: "home#exchange"
  post "send_email", to: "home#send_email"
end

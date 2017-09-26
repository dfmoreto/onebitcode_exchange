require 'rails_helper'
 
RSpec.describe "Exchange Currency Process", :type => :feature, js: true do
  it "exchange value" do
    visit '/'
    within("#exchange_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '10'
    end
 
    expect(find("#result").value).to_not be_nil
  end
end

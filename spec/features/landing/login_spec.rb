require 'rails_helper'

feature 'Login', js: true do
  include DeviseHelpers

  scenario 'Login should work for non paying customers' do
    user = create(:user)
    login(user)
    expect(page.text).to include('Start Trial')
  end

  scenario 'Login should work for paying customers' do
    user = create(:user, paying_customer: true)
    login(user)
    expect(page.text).to_not include('Start Trial')
    expect(page.text).to include('Dashboard')
  end
end

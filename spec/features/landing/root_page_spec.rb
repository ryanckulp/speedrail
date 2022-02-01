require 'rails_helper'

feature 'Root page', :js => true do
  before do
    visit root_path
  end

  scenario 'Root page should work' do
    expect(page).to have_text 'Contact'
    expect(page).to have_text 'Login'
    expect(page).to have_text 'Signup'

    expect(page).to_not have_text 'Logout'
  end
end

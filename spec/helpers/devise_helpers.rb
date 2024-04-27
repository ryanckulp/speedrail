# frozen_string_literal: true

module DeviseHelpers
  def sign_up
    user = build(:user)
    visit new_user_registration_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'

    click_button 'Sign up'
    @user = User.find_by_email(user.email)
  end

  def login(user)
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'

    click_button 'Login'
  end
end

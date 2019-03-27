class UserMailer < ApplicationMailer
  def new_signup(user)
    @user = user
    mail(to: user.email, subject: 'welcome!')
  end
end

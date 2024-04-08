require 'rails_helper'

RSpec.describe MailLog, type: :model do
  subject { build(:mail_log) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  before do
    @user = create(:user)
  end

  describe 'create' do
    it 'expects a mailer to generate a mail_log' do
      expect { UserMailer.welcome(@user).deliver }.to change { MailLog.count }.by 1
    end

    it 'expects to have the properties of a sent mail' do
      UserMailer.welcome(@user).deliver
      ml = MailLog.last

      expect(ml.user).to eql @user
      expect(ml.to).to eql @user.email
      expect(ml.subject).to eql "Welcome to #{Rails.application.credentials.company_name}!"
      expect(ml.body).to include 'let us know if you need any help'
      expect(ml.mailer).to eql 'welcome'
    end
  end
end

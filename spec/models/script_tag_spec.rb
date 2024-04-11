require 'rails_helper'

RSpec.describe ScriptTag, type: :model do
  subject { build(:script_tag) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  describe 'ActiveModel validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:code) }
  end
end

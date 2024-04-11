FactoryBot.define do
  factory :script_tag do
    name { 'Fomo.com' }
    code { '<script src="https://api.fomo.com/widget/asdf.js">' }
    enabled { true }
  end
end

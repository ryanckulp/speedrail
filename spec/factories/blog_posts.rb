FactoryBot.define do
  factory :blog_post do
    title { 'Ryan is awesome' }
    slug { 'kulp-equals-chad' }
    description { 'nothing more required' }
    body { 'we make our own luck' }
    draft { false }
  end
end

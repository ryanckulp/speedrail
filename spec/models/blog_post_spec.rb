require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  subject { build(:blog_post) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  describe 'ActiveModel validations' do
    it { expect(subject).to validate_presence_of(:title) }
    it { expect(subject).to validate_presence_of(:description) }
    it { expect(subject).to validate_presence_of(:body) }
  end

  describe 'scopes' do
    it 'returns published blog posts' do
      post = create(:blog_post, slug: 'basic-slug') # published by default
      expect(BlogPost.published).to include(post)
    end

    it 'returns draft blog posts' do
      post = create(:blog_post, slug: 'basic-slug', draft: true)
      expect(BlogPost.drafts).to include(post)
    end
  end

  describe 'instance methods' do
    it 'should override id param' do
      expect(subject.to_param).to eql subject.slug
    end
  end

  describe 'slug generator' do
    it 'works with proper input data' do
      post = create(:blog_post, slug: 'basic-slug')
      expect(post.slug).to eql 'basic-slug'
    end

    it 'works with improper input data' do
      post = create(:blog_post, slug: 'Complex     slug HERE')
      expect(post.slug).to eql 'complex-slug-here'
    end

    it 'works when slug already exists' do
      create(:blog_post, slug: 'unique-slug')
      post = create(:blog_post, slug: 'unique-slug')
      expect(post.slug).to_not eql 'unique-slug'
      expect(post.slug).to include('unique-slug-')
    end
  end
end

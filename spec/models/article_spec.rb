require 'spec_helper'
require 'rails_helper'

RSpec.describe Article, type: :model do
  RSpec.describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end

  RSpec.describe 'associations' do
    it { should have_many :comments }
  end

  RSpec.describe '#subject' do
    it 'returns the article titile' do
      article = create(:article, title: 'Lorem Ipsum')
      expect(article.subject).to eq 'Lorem Ipsum'
    end
  end

  RSpec.describe '#last_commit' do
    it 'returns the last comment' do
      article = create(:article_with_comments)

      expect(article.last_comment.body).to eq "comment body 3"
    end
  end
end

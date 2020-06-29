FactoryBot.define do
  factory :comment do
    author 'mike'
    sequence(:body) { |n| "comment body #{n}" }

    factory :article_with_comments do
      after :create do |article, evaluator|
        create_list :comment, 3, article: article
      end
    end
  end
end

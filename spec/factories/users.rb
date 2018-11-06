FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name 'Aaron'
    last_name 'Summer'
    sequence(:email) { |n| "tester#{n}@example.com" }
    password 'dottle-nouveau-pavilion-tights-furze'

    trait :with_project do
      after(:create) { |user| create_list(:project, 1, owner: user) }
    end
  end
end

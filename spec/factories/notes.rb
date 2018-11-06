FactoryBot.define do
  factory :note do
    sequence(:message) { |n| "This is note#{n}" }
    association :project
    user { project.owner }
  end
end

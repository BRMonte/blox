FactoryBot.define do
  factory :booking do
    association :meeting_room
    association :user
  end
end

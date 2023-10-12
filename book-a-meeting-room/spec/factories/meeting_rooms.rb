FactoryBot.define do
  factory :meeting_room do
    sequence(:name) { |n| "Meeting Room #{n}" }
  end
end

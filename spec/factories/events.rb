FactoryBot.define do
  factory :event do
    ride
    route

    trait :this_week do
      begins_at { Time.current.beginning_of_week + 2.days }
    end

    trait :next_week do
      begins_at { (Time.current + 1.week).beginning_of_week + 2.days }
    end
  end
end

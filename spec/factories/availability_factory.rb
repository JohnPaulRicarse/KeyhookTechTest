FactoryBot.define do
  factory :availability do
    manager_name { "Manager Name" }
    scheduled_date { DateTime.now + 1.week }
  end
end

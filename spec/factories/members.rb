FactoryBot.define do
  factory :member do
    first_name { 'John' }
    last_name { 'Doe' }
    gender { 'male' }
    age { 30 }
    role { 'doctor' }
  end

  trait :doctor do
    role { 'doctor' }
  end

  trait :patient do
    role { 'patient' }
  end
end
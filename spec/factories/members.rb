FactoryBot.define do
  factory :member do
    first_name { 'John' }
    last_name { 'Doe' }
    gender { 'male' }
    age { 30 }
    role { 'doctor' }
  end
end
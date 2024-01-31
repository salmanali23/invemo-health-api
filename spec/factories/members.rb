FactoryBot.define do
  factory :member do
    first_name { 'John' }
    last_name { 'Doe' }
    gender { ['male', 'female', 'other'].sample }
    age { 30 }
    role { 'doctor' }
  end

  trait :patient do
    role { 'patient' }
  end

  trait :with_random_role do 
    role { ['doctor', 'patient'].sample }
  end 

  trait :with_avatar do
    avatar { File.open("app/assets/images/avatar.jpeg")  }
  end

end
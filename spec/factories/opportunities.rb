FactoryBot.define do
  factory :opportunity do
    procedure_name { 'Sample Procedure' }
    
    association :patient, factory: [:member, :patient]
    association :doctor, factory: :member

    Time.now.utc.to_s
    stage_history { [{"Lead": Time.now.utc.to_s}] }
  end
end
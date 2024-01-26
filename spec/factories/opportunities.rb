FactoryBot.define do
  factory :opportunity do
    procedure_name { 'Sample Procedure' }
    patient {}
    doctor {}
    stage_history { 'Sample Stage History' }
  end
end
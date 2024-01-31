json.extract! opportunity, :id, :procedure_name, :stage_history
json.doctor do
  json.extract! opportunity.doctor, :id, :first_name, :last_name, :avatar
end

json.patient do
  json.extract! opportunity.patient, :id, :first_name, :last_name, :avatar, :age, :gender
end
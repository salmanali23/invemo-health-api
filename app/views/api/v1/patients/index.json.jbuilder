json.array! @resources do |resource|
  json.extract! resource, :id, :procedure_name, :stage_history

  json.doctor do
    json.extract! resource.doctor, :id, :first_name, :last_name, :avatar
  end

  json.patient do
    json.extract! resource.patient, :id, :first_name, :last_name, :avatar, :age, :gender
  end
end

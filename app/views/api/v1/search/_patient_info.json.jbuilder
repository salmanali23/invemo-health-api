json.extract! patient, :id, :age, :gender, :avatar
json.name patient.name

json.doctor do
  json.extract! opportunity.doctor, :id, :first_name, :last_name
end
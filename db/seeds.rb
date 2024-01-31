# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


doctor = Member.create!(first_name: 'John', last_name: 'Doe', gender: 'male', age: 30, role: 'doctor')
patient1 = Member.create!(first_name: 'Jane', last_name: 'Smith', gender: 'female',age: 25, role: 'patient')

patient2 = Member.create!(first_name: 'Tom', last_name: 'hanks', gender: 'male',age: 67, role: 'patient')


Opportunity.create(procedure_name: 'Procedure 1', patient: patient1, doctor: doctor, stage_history: [{"Lead"=>"Wed, 31 Jan 2024 03:40:22 GMT"}])
Opportunity.create(procedure_name: 'Procedure 2', patient: patient2, doctor: doctor, stage_history: [{"Lead"=>"Wed, 31 Jan 2024 03:40:22 GMT"}])
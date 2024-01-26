class Opportunity < ApplicationRecord
  belongs_to :patient, class_name: 'Member', foreign_key: 'patient_id'
  belongs_to :doctor, class_name: 'Member', foreign_key: 'doctor_id'

  validates :procedure_name, presence: true

  def permitted_attributes
    %i[procedure_name patient_id doctor_id stage_history]
  end
end

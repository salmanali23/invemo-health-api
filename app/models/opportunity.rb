class Opportunity < ApplicationRecord
  belongs_to :patient, class_name: 'Member', foreign_key: 'patient_id'
  belongs_to :doctor, class_name: 'Member', foreign_key: 'doctor_id'

  validates :procedure_name, presence: true

  def set_stage_history
    self.stage_history = [{"Lead": Time.now}]
  end
end

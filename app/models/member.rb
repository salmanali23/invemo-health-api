class Member < ApplicationRecord
  validates :first_name, :last_name,  presence: true
  validates :gender, inclusion: { in: %w(male female other), message: 'should be male or female' }
  validates :age, numericality: { greater_than: 0, only_integer: true }
  validates :role, inclusion: { in: %w(doctor patient), message: 'should be doctor or patient' }

  scope :doctors, -> { where(role: Member.roles[:doctor])}
  scope :patients, -> { where(role: Member.roles[:patient])}


  enum gender: { male: 1, female: 2, other: 3 }
  enum role: { doctor: 1, patient: 2 }

  has_one :opportunity_as_patient, class_name: 'Opportunity', foreign_key: 'patient_id'
  has_one :opportunity_as_doctor, class_name: 'Opportunity', foreign_key: 'doctor_id'

  mount_uploader :avatar, MemberAvatarUploader 

  def name
    "#{first_name} #{last_name}"
  end

  def permitted_attributes
    %i[first_name last_name gender age role avatar]
  end
end
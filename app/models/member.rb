class Member < ApplicationRecord
  validates :first_name, :last_name,  presence: true
  validates :gender, inclusion: { in: %w(male female), message: 'should be male or female' }
  validates :age, numericality: { greater_than: 0, only_integer: true }
  validates :role, inclusion: { in: %w(doctor patient), message: 'should be doctor or patient' }

  scope :doctors, -> { where(role: Member.roles[:doctor])}
  scope :patients, -> { where(role: Member.roles[:patient])}


  enum gender: { male: 1, female: 2 }
  enum role: { doctor: 1, patient: 2 }

  def name
    "#{first_name} #{last_name}"
  end

  def permitted_attributes
    %i[first_name last_name gender age role avatar]
  end
end

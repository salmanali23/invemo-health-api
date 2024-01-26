class Member < ApplicationRecord
  validates :first_name, :last_name,  presence: true
  validates :gender, inclusion: { in: ['male', 'female'], message: 'should be male or female' }
  validates :age, numericality: { greater_than: 0, only_integer: true }
  validates :role, inclusion: { in: ['doctor', 'patient'], message: 'should be doctor or patient' }

  enum gender: { male: 1, female: 2 }
  enum role: { doctor: 1, patient: 2 }

  def name
    "#{first_name} #{last_name}"
  end
end

require 'rails_helper'

RSpec.describe Opportunity, type: :model do
  describe 'associations' do
    it { should belong_to(:patient).class_name('Member').with_foreign_key('patient_id') }
    it { should belong_to(:doctor).class_name('Member').with_foreign_key('doctor_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:procedure_name) }
  end

  describe 'factory' do
    let(:doctor) { create(:member, :doctor) }
    let(:patient) { create(:member, :patient) }

    it 'is valid' do
      opportunity = create(:opportunity, patient: patient, doctor: doctor)
      expect(opportunity).to be_valid
    end
  end
end

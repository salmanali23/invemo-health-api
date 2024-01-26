require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it { should validate_numericality_of(:age).is_greater_than(0).only_integer }
  end

  describe '#name' do
    it 'returns the full name' do
      member = build(:member, first_name: 'John', last_name: 'Doe')
      expect(member.name).to eq('John Doe')
    end
  end

  describe '#gender' do
    it { should allow_values('male', 'female').for(:gender) }
  end

  describe '#age' do
    it { should validate_numericality_of(:age).is_greater_than(0).only_integer }
  end

  describe '#role' do
    it { should allow_values('doctor', 'patient').for(:role) }
  end

  describe '#objects' do
    it 'is valid with valid attributes' do
      member = build(:member)
      expect(member).to be_valid
    end

    it 'is invalid with invalid attributes' do
      member = build(:member, age: 0)
      expect(member).to be_invalid
    end
  end
end

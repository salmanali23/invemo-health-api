# spec/services/patient_search_spec.rb
require 'rails_helper'

RSpec.describe PatientSearch, type: :service do
  describe '#results' do
    context "when opportunity is present" do
      let!(:john_doe_patient) { create(:member, :patient, first_name: 'John', last_name: 'Doe') }
      let!(:john_opportunity) { create(:opportunity, procedure_name: 'Surgery', patient: john_doe_patient, doctor: create(:member)) }

      context 'when search term is present' do
        it 'returns opportunities based on the search term' do
          search_term = 'John'
          search = described_class.new(search_term)
          results = search.results

          expect(results).to include(john_opportunity)
        end
      end

      context 'when search term does not match' do
        it 'does not return opportunities' do
          no_search_term_patient = create(:member, :patient)
          no_search_term_opportunity = create(:opportunity, procedure_name: 'Surgery', patient: no_search_term_patient, doctor: create(:member))

          search = described_class.new("VeryRandom9999")
          results = search.results

          expect(results).to eq([])
        end
      end

      context 'when search term is not present' do
        it 'returns all opportunities' do
          jane_doe_patient = create(:member, :patient, first_name: 'Jane', last_name: 'Doe')
          jane_opportunity = create(:opportunity, procedure_name: 'Surgery', patient: jane_doe_patient, doctor: create(:member))

          search = described_class.new(nil)
          results = search.results
          all_opportunities = Opportunity.all

          expect(results.count).to eq(all_opportunities.count)
        end
      end
    end

    context 'when opportunity is not present' do
      context "when search term is present" do
        it 'returns empty array' do
          search = described_class.new(nil)
          results = search.results

          expect(results).to eq([])
        end
      end
      context "when search term is present" do
        it 'returns empty array' do
          search = described_class.new("John")
          results = search.results

          expect(results).to eq([])
        end
      end
    end
  end
end

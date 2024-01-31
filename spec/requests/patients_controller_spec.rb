# spec/requests/api/v1/patients_request_spec.rb
require 'rails_helper'

RSpec.describe 'Api::V1::Patients', type: :request do
  describe 'GET /api/v1/patients' do

    context "when opportunity is present" do
      let!(:john_doe_patient) { create(:member, :patient, first_name: 'Michal', last_name: 'Doe') }
      let!(:john_opportunity) { create(:opportunity, procedure_name: 'Surgery', patient: john_doe_patient, doctor: create(:member, first_name: "JohnA")) }
      let!(:jane_opportunity) { create(:opportunity, procedure_name: 'Surgery', patient: john_doe_patient, doctor: create(:member, first_name: "Jane")) }

      context 'when search term is present' do
        it 'returns opportunities based on the search term' do
          search_term = 'John'
          get "/api/v1/patients", params: {query: search_term}
          searched_result_doctor = parsed_response.first["doctor"]

          expect(parsed_response.first["id"]).to eq(john_opportunity.id)
          expect(searched_result_doctor["id"]).to eq(john_opportunity.doctor.id)
          expect(searched_result_doctor["first_name"]).to eq(john_opportunity.doctor.first_name)
        end
      end

      context 'when search term does not match' do
        it 'does not return opportunities' do
          no_search_term_patient = create(:member, :patient)
          no_search_term_opportunity = create(:opportunity, procedure_name: 'Surgery', patient: no_search_term_patient, doctor: create(:member))

          get "/api/v1/patients", params: {query: "VeryRandom9999"}

          expect(parsed_response).to eq([])
        end
      end

      context 'when search term is not present' do
        it 'returns all opportunities' do
          jane_doe_patient = create(:member, :patient, first_name: 'Jane', last_name: 'Doe')
          jane_opportunity = create(:opportunity, procedure_name: 'Surgery', patient: jane_doe_patient, doctor: create(:member))

          get "/api/v1/patients", params: {query: nil}
          all_opportunities = Opportunity.all

          expect(parsed_response.count).to eq(all_opportunities.count)
        end
      end
    end

    context 'when opportunity is not present' do
      context "when search term is present" do
        it 'returns empty array' do
          get "/api/v1/patients", params: {query: nil}
          

          expect(parsed_response).to eq([])
        end
      end
      context "when search term is present" do
        it 'returns empty array' do
          get "/api/v1/patients", params: {query: "John"}

          expect(parsed_response).to eq([])
        end
      end
    end


    def parsed_response
      JSON.parse(response.body)
    end
  end
end

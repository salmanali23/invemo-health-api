require 'rails_helper'

RSpec.describe 'Api::V1::Opportunities', type: :request do
  describe 'GET api/v1/opportunities/:id' do
    it 'returns a success and expected response ' do
      opportunity = create(:opportunity)
      get "/api/v1/opportunities/#{opportunity.id}"

      expect(response).to be_successful
      expect(parsed_response).to eq(build_expected_json_response(opportunity))
    end

    it 'returns a not found response' do
      get "/api/v1/opportunities/#{rand(99999)}"
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /api/v1/opportunities' do
    let(:doctor) { create(:member) }
    let(:patient) { create(:member, :patient) }

    context 'with valid parameters' do
      it 'creates a new opportunity' do
        expect {
          post '/api/v1/opportunities', params: { opportunity: valid_attributes }
        }.to change(Opportunity, :count).by(1)

        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'returns unprocessable_entity status' do
        expect {
          post '/api/v1/opportunities', params: { opportunity: invalid_attributes }
        }.to change(Opportunity, :count).by(0)
        
        expect(response).to have_http_status(:unprocessable_entity)
        expect(parsed_response).to have_key("errors")
      end
    end
  end

  describe 'PUT /api/v1/opportunities/:id' do
    let(:opportunity) { create(:opportunity) }

    context 'with valid parameters' do
      it 'updates an opportunity' do
        put "/api/v1/opportunities/#{opportunity.id}", params: { opportunity: valid_attributes(for_create: false) }

        expect(response).to be_successful
        expect(parsed_response).to eq(build_expected_json_response(opportunity.reload))
      end
    end

    context 'with invalid parameters' do
      it 'returns unprocessable_entity status' do
        put "/api/v1/opportunities/#{opportunity.id}", params: { opportunity: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(parsed_response).to have_key("errors")
      end
    end

    context 'with invalid id' do
      it 'returns not found status' do
        put "/api/v1/opportunities/#{rand(9999)}", params: { opportunity: valid_attributes(for_create: false) }

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  def parsed_response
    JSON.parse(response.body)
  end

  def build_expected_json_response(opportunity)
    {
      "opportunity" => {
        "id" => opportunity.id,
        "procedure_name" => opportunity.procedure_name,
        "stage_history" => opportunity.stage_history,
        "doctor" => member_details(opportunity.doctor),
        "patient" => member_details(opportunity.patient)
      }
    }.as_json
  end

  def member_details(member)
    {
      "id" => member.id,
      "first_name" => member.first_name,
      "last_name" => member.last_name
    }
  end

  def valid_attributes(for_create: true)
    {
      procedure_name: 'Procedure#Valid',
      patient_id: for_create ? patient.id : opportunity.patient_id,
      doctor_id: for_create ? doctor.id : opportunity.doctor_id,
      stage_history: [{ "Lead": Time.now.utc.to_s }, { "Qualified": Time.now.utc.to_s }]
    }
  end

  def invalid_attributes
    {
      procedure_name: nil,
      stage_history: [{ "Lead": Time.now.utc.to_s }, { "Qualified": Time.now.utc.to_s }]
    }
  end
end


require 'rails_helper'

RSpec.describe 'Api::V1::Members', type: :request do
  describe 'GET /api/v1/members' do
    it 'returns a success response and returns all members' do
      get '/api/v1/members'
      expect(response).to be_successful
      expect(parsed_response).to eq(Member.all.as_json)
    end

    context 'when doctors are selected' do
      it 'returns doctor members' do
        create_members_and_send_request(doctors: true)
        expect(response).to be_successful
        expect(parsed_response).to eq(Member.doctors.as_json)
      end
    end

    context 'when patients are selected' do
      it 'returns patient members' do
        create_members_and_send_request(patients: true)
        expect(response).to be_successful
        expect(parsed_response).to eq(Member.patients.as_json)
      end
    end

    context 'when an invalid option is passed' do
      it 'returns all members' do
        create_members_and_send_request(invalid: true)
        expect(response).to be_successful
        expect(parsed_response).to eq(Member.all.as_json)
      end
    end
  end

  describe 'GET /api/v1/members/:id' do
    it 'returns a success response' do
      member = create(:member)
      get "/api/v1/members/#{member.id}"
      expect(response).to be_successful
    end

    it 'returns a not found response' do
      get "/api/v1/members/#{rand(99999)}"
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /api/v1/members' do
    context 'with valid parameters' do
      it 'creates a new member' do
        expect {
          post '/api/v1/members', params: { member: valid_attributes }
        }.to change(Member, :count).by(1)
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'returns unprocessable_entity status' do
        expect {
          post '/api/v1/members', params: { member: invalid_attributes }
        }.to change(Member, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  def create_members_and_send_request(options = {})
    create_list(:member, rand(7), :with_random_role)
    get '/api/v1/members', params: options
  end

  def parsed_response
    JSON.parse(response.body)
  end

  def valid_attributes
    {
      first_name: 'First#Valid',
      last_name: 'Last#Valid',
      gender: 'male',
      age: 4,
      role: 'doctor',
      avatar: File.open('app/assets/images/avatar.jpeg')
    }
  end

  def invalid_attributes
    {
      last_name: 'Last#Valid',
      gender: 'custom',
      age: 4,
      role: 'doctor',
      avatar: File.open('app/assets/images/avatar.jpeg')
    }
  end
end

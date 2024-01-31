class Api::V1::PatientsController < Api::V1::BaseController
  def index
    @resources = PatientSearch.new(params[:query]).results
  end
end

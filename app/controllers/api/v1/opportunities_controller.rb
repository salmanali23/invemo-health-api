class Api::V1::OpportunitiesController < Api::V1::BaseController
  include Resourceable

  private

  def resource_params
    keys = initial_param.dig(:stage_history)&.flat_map(&:keys)
    initial_param.permit(
      :procedure_name,
      :patient_id,
      :doctor_id,
      stage_history: keys
    )
  end

  def initial_param
    @initial_param ||= params.require(:opportunity)
  end
end

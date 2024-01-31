class Api::V1::MembersController < Api::V1::BaseController
  include Resourceable
  include CloudinaryHelper

  def index
  filter_members
  render json: @resources
  end


  private

  def filter_members
    if params[:doctors] == 'true'
      @resources = Member.doctors
    elsif params[:patients] == 'true'
      @resources = Member.patients
    else
      @resources = Member.all
    end
  end
end

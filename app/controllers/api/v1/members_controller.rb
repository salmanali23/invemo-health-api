class Api::V1::MembersController < ApplicationController
  include Resourceable

  def index
    filter_members
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
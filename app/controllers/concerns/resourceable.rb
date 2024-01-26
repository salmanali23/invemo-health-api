module Resourceable
  extend ActiveSupport::Concern

  included do
    before_action :find_resource, only: [:edit, :update, :destroy, :show]
  end

  def index
    @resources = klass.all
  end

  def show
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      render :show, status: :ok
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def new
    @resource = klass.new
  end

  def create
    @resource = klass.new(resource_params)
    if @resource.save
      render :show
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to [controller_name.to_sym], notice: "Deleted"
  end

  private

  def find_resource
    @resource = klass.find(params[:id])
  end

  def klass
    controller_name.singularize.camelize.constantize
  end

  def resource_name
    controller_name.singularize
  end

  def resource_params
    params.require(resource_name).permit(klass.new.permitted_attributes)
  end
end

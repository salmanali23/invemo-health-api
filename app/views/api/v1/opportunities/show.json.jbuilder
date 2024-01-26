json.opportunity do
  json.partial! "opportunity", opportunity: @resource if @resource.present?
end

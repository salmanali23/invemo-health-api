json.member do
  json.partial! "member", member: @resource if @resource.present?
end

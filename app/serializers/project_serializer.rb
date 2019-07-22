class ProjectSerializer < ActiveModel::Serializer
  #With joins attributes :id, :title, :status, :funding, :goal, :project_donation_options, :country, :theme, :organization
  attributes :id, :gg_project_id, :gg_organization_id, :title, :status, :funding, :goal
end

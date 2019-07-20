class ProjectSerializer < ActiveModel::Serializer
  #With joins attributes :id, :title, :status, :funding, :goal, :project_donation_options, :country, :theme, :organization
  attributes :id, :title, :status, :funding, :goal
end

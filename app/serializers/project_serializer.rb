class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :funding, :goal, :project_donation_options, :country, :theme, :organization
end

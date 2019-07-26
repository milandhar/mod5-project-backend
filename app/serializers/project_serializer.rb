class ProjectSerializer < ActiveModel::Serializer
  #With joins attributes :id, :title, :status, :funding, :goal, :project_donation_options, :country, :theme, :organization
  attributes :id, :country, :theme, :organization, :gg_project_id, :gg_organization_id, :latitude, :longitude, :title, :status, :funding, :goal, :long_term_impact, :summary, :image_url
end

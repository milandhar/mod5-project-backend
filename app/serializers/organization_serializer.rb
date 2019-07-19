class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :mission, :url, :countries, :projects
end

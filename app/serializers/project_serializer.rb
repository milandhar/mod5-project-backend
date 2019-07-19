class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :funding, :goal, :country, :theme, :organization
end

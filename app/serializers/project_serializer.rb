class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :funding, :goal, :theme, :organization
end

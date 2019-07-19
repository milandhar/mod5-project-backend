class ProjectDonationOptionSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :amount, :description
end

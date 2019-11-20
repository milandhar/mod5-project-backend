class UserStarredProjectSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :project_id, :order_number
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :theme_interest_1, :theme_interest_2, :theme_interest_3
end

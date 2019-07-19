class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email_address, :first_name, :last_name, :theme_interest_1, :theme_interest_2, :theme_interest_3
end

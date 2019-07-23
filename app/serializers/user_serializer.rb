class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email_address, :first_name, :last_name, :theme1, :theme2, :theme3, :projects
end

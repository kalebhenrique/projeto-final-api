class UserSerializer < ActiveModel::Serializer
  attributes :id, :is_admin, :credit, :email, :authentication_token
end

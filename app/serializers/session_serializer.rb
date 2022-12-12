class SessionSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :authentication_token
end

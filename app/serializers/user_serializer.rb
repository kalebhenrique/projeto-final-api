class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :name, :credit, :profile_picture_url, :is_admin

  def profile_picture_url
    rails_blob_path(object.profile_picture, only_path: true) if object.profile_picture.attached?
  end
end

#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone_number, :current_user

  def current_user
    scope == object
  end
end

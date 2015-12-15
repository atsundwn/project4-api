#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone_number, :authy_id, :authy_status, :country_code :current_user

  def current_user
    scope == object
  end
end

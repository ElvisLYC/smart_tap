class User < ApplicationRecord
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  has_many :authentications, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      first_name: auth_hash["info"]["name"].split.first,
      last_name: auth_hash["info"]["name"].split.last,
      email: auth_hash["info"]["email"],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
  end

  # grab google to access google for user data
  def google_token
    x = self.authentications.find_by(provider: 'google_oauth2')
    return x.token unless x.nil?
  end

# facebook authentication
  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end
end

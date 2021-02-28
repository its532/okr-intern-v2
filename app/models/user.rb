class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: %i[google_oauth2]

  mount_uploader :image, ImageUploader
  has_many :personal_okrs
  has_many :section_okrs, through: :section_okr_votes

  protected

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.remote_image_url = auth.info.image
      user.admin = true if auth.info.email == ENV['ADMIN_KIKUYAMA'] || auth.info.email == ENV['ADMIN_TERADA'] || auth.info.email == ENV['ADMIN_TOMURA']
    end
  end
end

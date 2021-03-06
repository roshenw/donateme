class User < ActiveRecord::Base
  has_many :donations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

	 def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.image = auth.info.image
	  end
	end

  def is_admin?
      [2].include?(group) || ["10154183531100246"].include?(uid)
  end

end

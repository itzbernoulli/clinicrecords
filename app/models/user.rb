class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_roles
  has_many :roles, through: :user_roles

  def fullname
    self.first_name + " " + self.last_name
  end

  def is_superadmin?
  	is_type?("superadmin")
  end

  def is_admin?
  	is_type?("admin")  	
  end

  def is_frontdesk?
    is_type?("frontdesk")
  end  

  def is_nurse?
    is_type?("nurse")
  end  

  def is_doctor?
    is_type?("doctor")
  end  

  def is_pharmacist?
  	is_type?("pharmacist")
  end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     user.name = auth.info.name   # assuming the user model has a name
  #     user.image = auth.info.image # assuming the user model has an image
  #   end
  # end

  private
	def is_type? type
		self.roles.map(&:name).include?(type) ? true : false
	end
end

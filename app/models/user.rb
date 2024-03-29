# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  admin_name             :string
#  admin_update_time      :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  is_verified            :boolean          default(FALSE)
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  title                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

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

   def self.to_csv
    attributes = %w{id email first_name last_name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  # def self.to_csv
  #   CSV.generate do |csv|
  #     csv << column_names
  #     all.each do |result|
  #       csv << result.attributes.values_at(*column_names)
  #     end
  #   end
  # end


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

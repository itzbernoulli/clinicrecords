class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles

  def fullname
    self.first_name + " " + self.last_name
  end

  def is_admin?
  	is_type?("admin")
  end

  def is_hitter?
  	is_type?("hitter")  	
  end

  def is_anonymous
  	is_type?("anonymous")
  end

  private
	def is_type? type
		self.roles.map(&:name).include?(type) ? true : false
	end
end

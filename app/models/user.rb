class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles

  def is_admin?
  	is_type?("Admin")
  end

  def is_editor?
  	is_type?("Editor")  	
  end

  def is_anonymous
  	is_type?("Anonymous")
  end

  private
	def is_type? type
		self.roles.map(&:name).include?(type) ? true : false
	end
end

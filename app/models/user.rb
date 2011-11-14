class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  belongs_to :family
  has_many :chores
  has_and_belongs_to_many :chore_lists
  has_and_belongs_to_many :assignments, :class_name => "ChoreList"

  validates_presence_of :name, :email, :roles_mask
  validates_uniqueness_of :name, :email, :case_sensitive => false

  ROLES = %w[admin parent child]

  # The following three methods are for cancan
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def is?(role)
    roles.include?(role.to_s)
  end
end

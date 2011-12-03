class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable,
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :time_zone

  has_many :chore_lists

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email, :case_sensitive => false

  def get_chore_lists_by_date
    chore_lists.all.inject({}) do |list, cl|
      list[cl.date] ||= []
      list[cl.date] << cl
      list
    end
  end
end

class User < ActiveRecord::Base
  validates :username, :first_name, presence: true
  has_secure_password
  has_many :orders

  def full_name
    "#{first_name} #{last_name}"
  end

end

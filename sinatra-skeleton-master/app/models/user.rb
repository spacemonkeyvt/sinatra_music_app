class User < ActiveRecord::Base
  # We can't be too careful! Never store passwords in pain text!
  # You need to install the bcrypt gem for this to work.
  has_secure_password

  has_many :songs, dependent: :destroy

end

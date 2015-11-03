class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /.+@.+/
end

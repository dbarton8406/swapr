class User < ActiveRecord::Base
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /.+@.+/
end

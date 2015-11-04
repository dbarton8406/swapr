class User < ActiveRecord::Base
  has_secure_password

  before_validation :ensure_access_token!

  validates_presence_of :username
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /.+@.+\..+/
  validates :access_token, presence: true, uniqueness: true

  def as_json
    {
      "username" => self.username,
      "email"    => self.email
    }
  end

  # def as_json(options={})
  #   defaults = { only: [:email, :username, :password] }
  #   requested = defaults.merge(options)
  #   super(requested)
  # end

  def ensure_access_token!
    if self.access_token.blank?
      self.access_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(access_token: token)
      token = SecureRandom.hex
    end
    token
  end
end

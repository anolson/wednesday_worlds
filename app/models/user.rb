class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate(email, password)
    find_by_normalized_email(email).try(:authenticate, password)
  end

  def self.find_by_normalized_email(email)
    find_by(email: normalize_email(email))
  end

  def self.normalize_email(email)
    email.to_s.downcase.gsub(/\s+/, "")
  end
end

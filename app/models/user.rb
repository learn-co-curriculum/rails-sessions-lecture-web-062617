require 'digest'

class User < ApplicationRecord

  has_secure_password

  # def authenticate(password)
  #   hashed_password = Digest::SHA256.base64digest(password)
  #   hashed_password == self.password_digest
  # end
  #
  # def password=(password)
  #   hashed_password = Digest::SHA256.base64digest(password)
  #   self.password_digest = hashed_password
  # end


end

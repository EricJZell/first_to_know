class AuthorizationToken < ActiveRecord::Base
  validates :token, presence: true
end

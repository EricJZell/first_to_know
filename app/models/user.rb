class User < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  phony_normalize :phone_number, default_country_code: 'US'

  def admin?
    user_type == 'admin'
  end

end

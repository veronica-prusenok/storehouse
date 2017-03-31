class User < ApplicationRecord
  has_many :orders
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  default_value_for :admin, false

  scope :not_admins, -> { where(admin: false) }
end

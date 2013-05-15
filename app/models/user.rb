class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  has_many :programme_items, as: :author

  def name
    email
  end
end

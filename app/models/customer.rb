class Customer < ApplicationRecord
  has_many :orders
  has_many :tickets, through: :orders

  validates :name, :lastname, presence: true
  validates :email, presence: true, if: :valid_email?
  validates :email, uniqueness: true

  def valid_email?
    email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

end


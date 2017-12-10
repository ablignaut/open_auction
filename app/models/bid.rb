class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  validates :user,
            :auction,
            :value,
            presence: true
  validates :value,
            numericality: { greater_than: 0 },
            allow_blank: true
end

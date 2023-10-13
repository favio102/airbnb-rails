# frozen_string_literal: true

class Reservation < ApplicationRecord
  self.table_name = "air_bnb_reservations"
  belongs_to :property
  belongs_to :user
  has_one :payment, dependent: :destroy
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  scope :future_reservations, -> { where('checkout_date > ?', Date.today) }
end

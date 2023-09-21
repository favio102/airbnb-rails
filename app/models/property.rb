class Property < ApplicationRecord
  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :address_1, presence: true
  geocoded_by :address
  monetize :price_cents, allow_nil: true

  after_validation :geocode, if: -> { latitude.blank? && longitude.blank? }

  def address
    [state, country].compact.join(', ')
  end
end

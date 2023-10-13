# frozen_string_literal: true

class Favorite < ApplicationRecord
  self.table_name = "air_bnb_favorites"
  belongs_to :user
  belongs_to :property
end

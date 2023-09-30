module Countriable
  def country_name
    return unless country_code.present?
    country = ISO3166::Country[country_code]
    # country&.name
  end
end

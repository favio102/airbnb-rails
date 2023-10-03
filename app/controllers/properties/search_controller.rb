# frozen_string_literal: true

module Properties
  class SearchController < ApplicationController
    def index
      @properties = Property.city(search_params[:city])
    end

    private

    def search_params
      params.permit(:city, :country_code, :check_in, :checkout)
    end
  end
end

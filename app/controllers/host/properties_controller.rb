# frozen_string_literal = true

module Host
  class PropertiesController < ApplicationController
    before_action :authenticate_user!

    def new
      authorize current_user, policy_class: HostPolicy
      @property = Property.new(user: current_user)
    end

    def create
      authorize current_user, policy_class: HostPolicy
      @property = current_user.properties.new(property_params)

      if @property.save
        redirect_to host_dashboard_path
      else
        render :new
      end
    end

    def update
      authorize current_user, policy_class: HostPolicy
      @property = current_user.properties.find(params[:id])

      if @property.update(property_params)
        redirect_to host_dashboard_path
      else
        render :edit
      end
    end

    def destroy
      authorize current_user, policy_class: HostPolicy
      @property = current_user.properties.find(params[:id])

      if @property.destroy
        redirect_to host_dashboard_path
      else
        render :edit
      end
    end

    private

    def property_params
      params.require(:property).permit(
        :name, :headline, :description, :images, :address_1, :address_2, :city,
        :state, :zip_code, :country_code, :price
      )
    end
  end
end

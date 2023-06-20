module Api
  module V1
    class TestsController < ApplicationController
      before_action :every_data
      skip_before_action :require_login

      def index; end

      def commodity_data
        render json: @commodities
      end

      def customer_data
        render json: @customers
      end

      def order_data
        render json: @orders
      end

      def all_data
        render json: [@commodities, @customers, @orders]
      end

      private

      def every_data
        @commodities = Commodity.order(:id)
        @customers = Customer.order(:id)
        @orders = Order.order(:id)
      end
    end
  end
end

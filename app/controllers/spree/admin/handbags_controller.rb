module Spree
  module Admin
    class HandbagsController < ResourceController
      def index
        @handbags = Spree::Handbag.page(params[:page] || 1).per(50)
      end
      def new
         @handbag = Handbag.new
         @users = Spree::User.all
     end
    end
  end
end

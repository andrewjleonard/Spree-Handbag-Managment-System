module Spree
  module Admin
    class HandbagsController < ResourceController

      def index
        @handbags = Spree::Handbag.page(params[:page] || 1).per(50)
      end
      def new
         @handbag = Handbag.new
     end
      def clean
        @handbags = Spree::Handbag.is_clean.page(params[:page] || 1).per(50)
     end
      def repair
        @handbags = Spree::Handbag.is_repair.page(params[:page] || 1).per(50)
     end
      def colour
        @handbags = Spree::Handbag.is_colour.page(params[:page] || 1).per(50)
     end
      def show
        @handbags = Spree::Handbag.find(params[:id])
      end
      def clean_completed
          @handbag = Spree::Handbag.find params[:id]
          @handbag.stage = 1
          @handbag.save
          expect(flash[:success]).to eq("Handbag #{@handbag.id.inspect} has been successfully updated!")
end 
      end
  end
end

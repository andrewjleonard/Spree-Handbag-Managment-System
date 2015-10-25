module Spree
  module Admin
    class HandbagsController < ResourceController

      def index
        @handbags = Spree::Handbag.page(params[:page]).per(50)
      end
  def collection_actions
    [:index, :clean, :repair, :colour]
  end

      def new
         @handbag = Handbag.new
     end
      def clean

        @handbags = Spree::Handbag.is_clean.page(params[:page]).per(50)

     end
      def repair
        @handbags = Spree::Handbag.is_repair.page(params[:page]).per(50)
     end
      def colour
        @handbags = Spree::Handbag.is_colour.page(params[:page]).per(50)
     end
      def show
        @handbag = Spree::Handbag.find(params[:id])
        @microposts = @handbag.microposts.page(params[:page]).per(10)
      end
      def clean_completed
        @movedTo = 'REPAIR'
    invoke_callbacks(:update, :before)
    if @handbag.is_repair == true
    @handbag.stage = 2
  elsif @handbag.is_repair == false && @handbag.is_colour == true
      @handbag.stage = 3
      @movedTo = 'COLOUR'
    elsif @handbag.is_repair == false && @handbag.is_colour == false
      @handbag.stage = 4
      @movedTo = 'Quality Control'
    end
    if @handbag.save
      invoke_callbacks(:update, :after)
      flash[:success] = flash_message_for(@handbag, "Handbag completed, moved to #{@movedTo}")
      respond_with(@handbag) do |format|
        format.html { redirect_to :back }
        format.js   { render :partial => "spree/admin/handbags/cleaned" }
      end
    else
      invoke_callbacks(:update, :fails)
      respond_with(@handbag) do |format|
        format.html do
          flash.now[:error] = @handbag.errors.full_messages.join(", ")
          render action: 'edit'
        end
        format.js { render layout: false }
      end
    end
      end

      def repair_completed
        @movedTo = 'COLOUR'
    invoke_callbacks(:update, :before)
    if @handbag.is_colour == true
    @handbag.stage = 3
  elsif @handbag.is_colour == false
      @handbag.stage = 4
      @movedTo = 'Quality Control'
    end
    if @handbag.save
      invoke_callbacks(:update, :after)
      flash[:success] = flash_message_for(@handbag, "Handbag completed, moved to #{@movedTo}")
      respond_with(@handbag) do |format|
        format.html { redirect_to :back }
        format.js   { render :partial => "spree/admin/handbags/cleaned" }
      end
    else
      invoke_callbacks(:update, :fails)
      respond_with(@handbag) do |format|
        format.html do
          flash.now[:error] = @handbag.errors.full_messages.join(", ")
          render action: 'edit'
        end
        format.js { render layout: false }
      end
    end
      end

            def colour_completed
        @movedTo = 'Quality Control'
    invoke_callbacks(:update, :before)
    @handbag.stage = 4
    if @handbag.save
      invoke_callbacks(:update, :after)
      flash[:success] = flash_message_for(@handbag, "Handbag completed, moved to #{@movedTo}")
      respond_with(@handbag) do |format|
        format.html { redirect_to :back }
        format.js   { render :partial => "spree/admin/handbags/cleaned" }
      end
    else
      invoke_callbacks(:update, :fails)
      respond_with(@handbag) do |format|
        format.html do
          flash.now[:error] = @handbag.errors.full_messages.join(", ")
          render action: 'edit'
        end
        format.js { render layout: false }
      end
    end
      end
          private
      def model_class
        Handbag
      end
  end
end
end
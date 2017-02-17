module Spree
  module Admin
    class HandbagsController < ResourceController

      def index
        @handbags = Spree::Handbag.all.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.ransack({
                                               m: 'or',
                                               user_bill_address_lastname_start: params[:search],
                                               user_bill_address_firstname_start: params[:search],
                                               user_ship_address_lastname_start: params[:search],
                                               user_ship_address_firstname_start: params[:search],
                                               user_email_start: params[:search],
                                               security_tag_start: params[:search],
                                               make_start: params[:search],
                                               agent_start: params[:search]
          }).result.limit(10).page(params[:page]).per(50)
        else
          @handbags = Spree::Handbag.all.page(params[:page]).per(50)
        end
      end

      def collection_actions
        [:index, :clean, :repair, :colour, :quality, :complete, :limbo, :archive, :overdue, :complaints]
      end

      def new
        @handbag = Handbag.new
        @readonly = false
      end

      def clean
        @handbags = Spree::Handbag.is_clean.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.is_clean.ransack({
                                                        m: 'or',
                                                        user_bill_address_lastname_start: params[:search],
                                                        user_bill_address_firstname_start: params[:search],
                                                        user_ship_address_lastname_start: params[:search],
                                                        user_ship_address_firstname_start: params[:search],
                                                        user_email_start: params[:search],
                                                        make_start: params[:search],
                                                        security_tag_start: params[:search],
          }).result.limit(10).page(params[:page])
        else
          @handbags = Spree::Handbag.is_clean.page(params[:page]).per(50)
        end
      end

      def repair
        @handbags = Spree::Handbag.is_repair.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.is_repair.ransack({
                                                         m: 'or',
                                                         user_bill_address_lastname_start: params[:search],
                                                         user_bill_address_firstname_start: params[:search],
                                                         user_ship_address_lastname_start: params[:search],
                                                         user_ship_address_firstname_start: params[:search],
                                                         user_email_start: params[:search],
                                                         make_start: params[:search],
                                                         security_tag_start: params[:search]
          }).result.limit(10).page(params[:page])
        else
          @handbags = Spree::Handbag.is_repair.page(params[:page]).per(50)
        end
      end
      def colour
        @handbags = Spree::Handbag.is_colour.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.is_colour.ransack({
                                                         m: 'or',
                                                         user_bill_address_lastname_start: params[:search],
                                                         user_bill_address_firstname_start: params[:search],
                                                         user_ship_address_lastname_start: params[:search],
                                                         user_ship_address_firstname_start: params[:search],
                                                         user_email_start: params[:search],
                                                         make_start: params[:search],
                                                         security_tag_start: params[:search]
          }).result.limit(10).page(params[:page])
        else
          @handbags = Spree::Handbag.is_colour.page(params[:page]).per(50)
        end
      end

      def quality
        @handbags = Spree::Handbag.is_quality.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.is_quality.ransack({
                                                          m: 'or',
                                                          user_bill_address_lastname_start: params[:search],
                                                          user_bill_address_firstname_start: params[:search],
                                                          user_ship_address_lastname_start: params[:search],
                                                          user_ship_address_firstname_start: params[:search],
                                                          user_email_start: params[:search],
                                                          make_start: params[:search],
                                                          security_tag_start: params[:search]
          }).result.limit(10).page(params[:page])
        else
          @handbags = Spree::Handbag.is_quality.page(params[:page]).per(50)
        end
      end

      def complete
        @handbags = Spree::Handbag.is_complete.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.is_complete.ransack({
                                                           m: 'or',
                                                           user_bill_address_lastname_start: params[:search],
                                                           user_bill_address_firstname_start: params[:search],
                                                           user_ship_address_lastname_start: params[:search],
                                                           user_ship_address_firstname_start: params[:search],
                                                           user_email_start: params[:search],
                                                           make_start: params[:search],
                                                           security_tag_start: params[:search]
          }).result.limit(10).page(params[:page])
        else
          @handbags = Spree::Handbag.is_complete.page(params[:page]).per(50)
        end
      end
      def limbo
        @handbags = Spree::Handbag.is_limbo.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.is_limbo.ransack({
                                                        m: 'or',
                                                        user_bill_address_lastname_start: params[:search],
                                                        user_bill_address_firstname_start: params[:search],
                                                        user_ship_address_lastname_start: params[:search],
                                                        user_ship_address_firstname_start: params[:search],
                                                        user_email_start: params[:search],
                                                        make_start: params[:search],
                                                        security_tag_start: params[:search],
                                                        agent_start: params[:search]
          }).result.limit(10).page(params[:page])
        else
          @handbags = Spree::Handbag.is_limbo.page(params[:page]).per(50)
        end
      end
      def complaints
        @handbags = Spree::Handbag.is_complaints.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.is_complaints.ransack({
                                                        m: 'or',
                                                        user_bill_address_lastname_start: params[:search],
                                                        user_bill_address_firstname_start: params[:search],
                                                        user_ship_address_lastname_start: params[:search],
                                                        user_ship_address_firstname_start: params[:search],
                                                        user_email_start: params[:search],
                                                        make_start: params[:search],
                                                        security_tag_start: params[:search],
                                                        agent_start: params[:search]
          }).result.limit(10).page(params[:page])
        else
          @handbags = Spree::Handbag.is_complaints.page(params[:page]).per(50)
        end
      end
      def archive
        @handbags = Spree::Handbag.is_archive.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.is_archive.ransack({
                                                          m: 'or',
                                                          user_bill_address_lastname_start: params[:search],
                                                          user_bill_address_firstname_start: params[:search],
                                                          user_ship_address_lastname_start: params[:search],
                                                          user_ship_address_firstname_start: params[:search],
                                                          user_email_start: params[:search],
                                                          make_start: params[:search],
                                                          security_tag_start: params[:search],
                                                          agent_start: params[:search]
          }).result.limit(10).page(params[:page])
        else
          @handbags = Spree::Handbag.is_archive.page(params[:page]).per(50)
        end
      end

      def overdue
        @handbags = Spree::Handbag.is_overdue.page(params[:page]).per(50)
        if params[:search]
          @handbags = Spree::Handbag.is_overdue.ransack({
                                                          m: 'or',
                                                          user_bill_address_lastname_start: params[:search],
                                                          user_bill_address_firstname_start: params[:search],
                                                          user_ship_address_lastname_start: params[:search],
                                                          user_ship_address_firstname_start: params[:search],
                                                          user_email_start: params[:search],
                                                          make_start: params[:search],
                                                          security_tag_start: params[:search],
                                                          agent_start: params[:search]
          }).result.limit(10).page(params[:page])
        else
          @handbags = Spree::Handbag.is_overdue.page(params[:page]).per(50)
        end
      end

      def show
        @handbag = Spree::Handbag.find(params[:id])
        @microposts = @handbag.microposts.page(params[:page]).per(10)
      end

      def clean_completed
        @movedTo = 'repair'
        invoke_callbacks(:update, :before)
        if @handbag.is_repair == true
          @handbag.stage = 2
        elsif @handbag.is_repair == false && @handbag.is_colour == true
          @handbag.stage = 3
          @movedTo = 'colour'
        elsif @handbag.is_repair == false && @handbag.is_colour == false
          @handbag.stage = 4
          @movedTo = 'quality control'
        end
        if @handbag.save
          if @movedTo == 'quality control'
          else
            unless @handbag.user.opted_out?
              HmsCommunicator.progress_email(@handbag, 'cleaned', @movedTo).deliver_now
            end
          end
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
          end
        end
      end

      def repair_completed
        @movedTo = 'colour'
        invoke_callbacks(:update, :before)
        if @handbag.is_colour == true
          @handbag.stage = 3
        elsif @handbag.is_colour == false
          @handbag.stage = 4
          @movedTo = 'quality control'
        end
        if @handbag.save
          if @movedTo == 'quality control'
          else
            unless @handbag.user.opted_out?
              HmsCommunicator.progress_email(@handbag, 'cleaned', @movedTo).deliver_now
            end
          end
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
          end
        end
      end

      def colour_completed
        @movedTo = 'quality control'
        invoke_callbacks(:update, :before)
        @handbag.stage = 4
        if @handbag.save
          if @movedTo == 'quality control'
          else
            unless @handbag.user.opted_out?
              HmsCommunicator.progress_email(@handbag, 'cleaned', @movedTo).deliver_now
            end
          end
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
          end
        end
      end

      def quality_completed
        @movedTo = 'completed'
        invoke_callbacks(:update, :before)
        @handbag.stage = 5
        if @handbag.save
            unless @handbag.user.opted_out?
              HmsCommunicator.completed_email(@handbag).deliver_now
            end
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
          end
        end
      end

      def move_limbo
        @handbag.stage = 6
        if @handbag.save
          flash[:success] = "Moved to Limbo"
          redirect_to :back
        else
          render :back
        end
      end

      def create
        invoke_callbacks(:create, :before)
        # Randomise the submitted image names.
        if permitted_resource_params[:pictures]
          permitted_resource_params[:pictures].each{ |p| p.original_filename["."]= "#{SecureRandom.hex(4)}." }
        end

        @handbag.attributes = permitted_resource_params
        @movedTo = ''
        if @handbag.save
          HmsCommunicator.entered_email(@handbag).deliver_now
          invoke_callbacks(:create, :after)
          flash[:success] = flash_message_for(@handbag, :successfully_created)
          respond_with(@handbag) do |format|
            format.html { redirect_to admin_handbag_url(@handbag) }
            format.js   { render :layout => false }
          end
        else
          @readonly = false
          invoke_callbacks(:create, :fails)
          respond_with(@handbag) do |format|
            format.html do
              flash.now[:error] = @handbag.errors.full_messages.join(", ")
              render action: 'new'
            end
            format.js { render layout: false }
          end
        end
      end

      def update
        invoke_callbacks(:update, :before)
        # Randomise the submitted image names.
        if permitted_resource_params[:pictures]
          permitted_resource_params[:pictures].each{ |p| p.original_filename["."]= "#{SecureRandom.hex(4)}." }
        end

        if @handbag.update_attributes(permitted_resource_params)
          invoke_callbacks(:update, :after)
          flash[:success] = flash_message_for(@handbag, :successfully_updated)
          respond_with(@handbag) do |format|
            format.html { redirect_to location_after_save }
            format.js { render layout: false }
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

      def handbag_params
        params.require(:handbag).permit({pictures: []})
      end

      def micropost_params
        params.require(:handbag).permit(:picture)
      end
      def model_class
        Handbag
      end
    end
  end
end

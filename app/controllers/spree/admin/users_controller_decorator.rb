Spree::Admin::UsersController.class_eval do
     def create

        @user = Spree.user_class.new(user_params)

        # If user is created by an admin, generate random password.
	
		if params[:tagmin]==""        
        if @user.password.blank?
          generated_password = Devise.friendly_token.first(8)
          @user.password = generated_password
          @user.password_confirmation = generated_password
          end
      end
      		byebug
          if @user.save
            set_roles

            flash.now[:success] = flash_message_for(@user, :successfully_created)
            render :edit
          else
            render :new
          end
        end
    end
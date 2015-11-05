Spree::Admin::UserSessionsController.class_eval do
  def redirect_back_or_default(default)
    if spree_current_user && spree_current_user.has_spree_role?("hms-technical")
      redirect_to(admin_handbags_clean_path)
    elsif spree_current_user && spree_current_user.has_spree_role?("hms-admin")
    	redirect_to(admin_users_path)
    else
      redirect_to(admin_path)
    end
  end
end
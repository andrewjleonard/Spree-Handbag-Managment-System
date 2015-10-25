Spree::Admin::UserSessionsController.class_eval do
  def redirect_back_or_default(default)
    if spree_current_user && spree_current_user.has_spree_role?("technical")
      redirect_to(admin_handbags_path)
    else
      redirect_to(default)
    end
  end
end
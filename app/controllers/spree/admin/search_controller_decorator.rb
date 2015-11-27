Spree::Admin::SearchController.class_eval do
  def authorize_admin
    if respond_to?(:model_class, true) && model_class
      record = model_class
    else
      record = controller_name.to_sym
    end
    if spree_current_user.respond_to?(:has_spree_role?) && spree_current_user.has_spree_role?('hms-admin')
    else
      authorize! :admin, record
      authorize! action, record
    end
  end
end

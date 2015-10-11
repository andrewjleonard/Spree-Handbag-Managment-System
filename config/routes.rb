Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  match 'admin/handbags/clean', :to => 'admin/handbags#clean', :via => [:get, :post]
  match 'admin/handbags/repair', :to => 'admin/handbags#repair', :via => [:get, :post]
  match 'admin/handbags/colour', :to => 'admin/handbags#colour', :via => [:get, :post]
end
Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :handbags do
      member do
        put :clean_completed, :repair_completed
      end
      collection do
        post :update_positions
      end
    end
  end
end
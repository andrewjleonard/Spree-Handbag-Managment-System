Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  #  match 'admin/handbags', :to => 'admin/handbags#clean', :via => [:get]

end
Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :handbags do
      member do
        put :clean_completed, :repair_completed, :colour_completed, :move_limbo, :quality_completed
      end
      collection do
        post :update_positions
        get :clean, :repair, :colour, :limbo, :complete, :quality, :archive, :overdue
      end

    end
    resources :microposts, only: [:create, :destroy]
  end
end
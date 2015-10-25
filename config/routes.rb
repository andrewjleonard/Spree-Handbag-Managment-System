Spree::Core::Engine.routes.draw do
  # Add your extension routes here
end
Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :handbags do
      member do
        put :clean_completed, :repair_completed
      end
      collection do
        post :update_positions
        get :clean, :repair, :colour
      end

    end
    resources :microposts, only: [:create, :destroy]
  end
end
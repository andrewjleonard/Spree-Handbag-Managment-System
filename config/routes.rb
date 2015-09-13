Spree::Core::Engine.routes.draw do
  # Add your extension routes here
end
Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :handbags do
      collection do
        post :update_positions
      end
    end
  end
end
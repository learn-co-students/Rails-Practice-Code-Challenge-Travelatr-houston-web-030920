Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :bloggers, :destinations
    resources :posts do
      put :likes
    end

end

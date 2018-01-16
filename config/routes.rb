Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :categories, only: :index
    resources :items, only: [:index, :show] do
      get 'by_category', on: :collection
    end
  end
end

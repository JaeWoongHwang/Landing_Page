Rails.application.routes.draw do
  match '/:locale' => 'posts#index', via: [:get]

  scope "{:locale}", locale: /#{I18n.available_locales.join("|")}/ do
    resources :posts
    root 'posts#index'
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

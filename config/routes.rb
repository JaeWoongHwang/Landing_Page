Rails.application.routes.draw do
  # match '/:locale' => 'posts#index', via: [:get]
  get "/:locale" => 'posts#index'
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/board' => 'posts#board'

  root 'posts#index'

  scope "(:locale)", locale: /ko|en|ja|'zh-CN'/ do
    resources :posts
  end

  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

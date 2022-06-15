Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts
  get "posts/search/sort_new", to: "posts#search", as: "sort_new"
end

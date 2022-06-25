Rails.application.routes.draw do
  root "articles#index"
  get "/delete_all", to: "articles#delete_all", as: "delete_all"
  get "/from", to: "articles#from", as: "from"

  get "/users/regenerate", to: "users#regenerate", as: "regenerate_users"
  get "/users/destroy_all", to: "users#destroy_all", as: "destroy_all_user"
  post "/users/destroy", to: "users#destroy", as: "destroy_user"
  post "/users/destroy_sanitized", to: "users#destroy_sanitized", as: "destroy_sanitized_user"
end

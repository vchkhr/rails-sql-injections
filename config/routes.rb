Rails.application.routes.draw do
  root "articles#index"
  get "/delete_all", to: "articles#delete_all", as: "delete_all"
end

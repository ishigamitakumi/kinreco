Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

root :to => 'homes#top'
get "homes/about" => "homes#about"

scope module: :public do
get "customers/calendar" => "customers#calendar"
resources :customers, only: [:show,:index, :edit, :update]
resources :muscle_posts, only: [:new,:create,:index,:show, :edit, :update,:destroy]
end

namespace :admin do
resources :customers, only: [:show,:index]
resources :muscle_menus, only: [:index,:create,:edit,:update,:destroy]
end
end

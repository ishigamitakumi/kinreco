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

root :to => 'homes#about'
get "homes/about" => "homes#about"

scope module: :public do
get "customers/calendar" => "customers#calendar"
get "customers/result" => "customers#result"
get "muscle_posts/tl" => "muscle_posts#tl"
resources :customers, only: [:show,:index, :edit, :update] do
  resource :relationships, only: [:create,:destroy]
  get "followings" => "relationships#followings", as: "followings"
  get "followers" => "relationships#followers", as: "followers"
   member do
      get :favorites
    end
end
resources :muscle_posts, only: [:new,:create,:index,:show, :edit, :update,:destroy] do
  resource :favorites, only: [:create,:destroy]
  end
resources :muscle_menus, only: [:index]
resource :contacts, only: [:new, :create] do
 get "/thanks" => "contacts#thanks"
 get "" => "contacts#back"
end
end

namespace :admin do
resources :customers, only: [:show,:index,:destroy]
resources :muscle_menus, only: [:index,:create,:edit,:update,:destroy]
end
end

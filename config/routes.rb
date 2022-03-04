Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root :to => 'homes#top'
get "homes/about" => "homes#about"

scope module: :public do

end

namespace :admin do

end
end

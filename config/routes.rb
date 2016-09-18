Rails.application.routes.draw do
  namespace :api, defaults:{ format: :json }do
    namespace :v1 do
      resources :users, only: [:show, :create, :destroy, :update]
    end
  end

  get "*path" => "application#default"
end

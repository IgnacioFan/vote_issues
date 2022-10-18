Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :issues, only: %i[index create show] do
        member do
          post :vote
        end
      end
    end
  end
end

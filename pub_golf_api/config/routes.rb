Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      scope :auth do
        get 'is_signed_in', to: 'auth#is_signed_in?'
      end
    end
  end
  root to: 'site#index'
end

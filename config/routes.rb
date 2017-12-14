Rails.application.routes.draw do
  root to: 'home#index'
  # get '/sign_up_success', to: 'home#successful_signup'
  mount_devise_token_auth_for 'User', at: '/auth'

  scope :api do
    scope :v1 do
    	resources :user, controller: 'api/v1/user'
      resources :word_list, controller: 'api/v1/word_list'
      resources :word_list_item, controller: 'api/v1/word_list_item'
    end
  end
end

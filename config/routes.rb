Rails.application.routes.draw do
  root to: 'pages#home'

  resources :polls, only: [:create, :show], param: :token do
    resources :poll_responses, only: [:create]
  end
end

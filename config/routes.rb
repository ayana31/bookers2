Rails.application.routes.draw do
	
  devise_for :users

  devise_scope :social_account do
  	get 'sign_out', to: "sessions#destroy"
  end

  root 'books#top'
  get '/about' => 'books#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   resources :books
   resources :users, only: [:show, :edit, :update, :index,]

end
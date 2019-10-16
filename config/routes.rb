Rails.application.routes.draw do

	root 'books#index'
	#root 'users#show'

	devise_for :users

	resources :users, only:[:show,:edit]

	resources :books

end

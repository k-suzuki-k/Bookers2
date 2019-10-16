Rails.application.routes.draw do

	root 'books#index'

	devise_for :users

	resources :users, only:[:index,:show,:edit,:update]

	resources :books

end

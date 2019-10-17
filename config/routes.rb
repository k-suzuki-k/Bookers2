Rails.application.routes.draw do


	root 'home#index'

	scope :home do
		resources :about, only:[:index]
	end

	devise_for :users

	resources :users, only:[:index,:show,:edit,:update]

	resources :books

end

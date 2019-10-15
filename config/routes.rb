Rails.application.routes.draw do

	root 'user#index'

	devise_for :users

end

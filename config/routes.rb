Rails.application.routes.draw do
  get 'songs/index'

  get 'songs/show'

  get 'songs/edit'

  get 'songs/create'

  get 'songs/update'

  get 'songs/destroy'

  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

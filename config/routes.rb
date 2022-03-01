Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'people', to: 'people#index'
  get 'people/index'
  get 'people/add'
  post 'people/add', to: 'people#create'
  get 'people/edit/:id' , to: 'people#edit'
  patch 'people/edit/:id', to: 'people#update'
  get 'people/delete/:id' , to: 'people#delete'

  get 'people/:id',to:'people#show'

end

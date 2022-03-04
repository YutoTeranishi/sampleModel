Rails.application.routes.draw do
  resources :mycontacts
  get 'messages', to: 'messages#index'
  get 'messages/index'
  get 'messages/show'
  get 'messages/add'
  post 'messages/add', to: 'messages#create'
  get 'messages/edit/:id' , to: 'messages#edit'
  patch 'messages/edit/:id', to: 'messages#update'
  get 'messages/delete/:id' , to: 'messages#delete'

  get 'messages/:id',to:'messages#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'people', to: 'people#index'
  get 'people/index'
  get 'people/add'
  post 'people/add', to: 'people#create'
  get 'people/find'
  post 'people/find'


  get 'people/edit/:id' , to: 'people#edit'
  patch 'people/edit/:id', to: 'people#update'
  get 'people/delete/:id' , to: 'people#delete'


  get 'people/:id',to:'people#show'

end

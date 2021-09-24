Rails.application.routes.draw do
  devise_for :users
  root 'books#index'

  post 'books/take_book'
  

  get 'books/borrowed', to: 'books#borrowed_books'

  delete 'books/delete_reservation', to: 'books#delete_reservation'


  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end

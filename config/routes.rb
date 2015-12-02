Rails.application.routes.draw do
  resources :reviews
#get "/books" => "books#index", as: 'books'
#get "/books/new" => "books#new", as: 'new_book'
#get "/books/:id" => "books#show", as: 'book'
#post "/books" => "books#create"
#get "/books/:id/edit" => "books#edit", as: 'edit_book'
#patch "/books/:id" => "books#update"
#delete "/books/:id" => "books#destroy"
#resources :books

resources :books do
  resources :reviews
  get 'page/:page', :action => :index, :on => :collection
end

root 'books#index'
end

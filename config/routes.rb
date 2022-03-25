Rails.application.routes.draw do
  root 'books#index'

  get 'top' => 'books#top'
  post 'books' => 'books#create'

  get 'new' => 'books#new'
  # get 'books/new'

  get 'books/show'
  get 'books/edit'

end

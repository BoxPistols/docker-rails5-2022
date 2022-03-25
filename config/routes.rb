Rails.application.routes.draw do
  root 'books#index'

  get 'books/index'

  get 'books/new'

  post 'books/create'

  get 'books/show'
  get 'books/edit'

end

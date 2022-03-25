Rails.application.routes.draw do
  root 'books#index'

  get 'books/index'

  get 'books/new'

  get 'books/show'
  get 'books/edit'

end

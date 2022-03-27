Rails.application.routes.draw do
  devise_for :users
  
  root 'books#index'

  # TOP画面
  get 'top' => 'books#index'
  get 'books' => 'books#top'

  # POST画面
  get 'new' => 'books#new'
  post 'books' => 'books#create'

  # 詳細画面
  get 'books/:id' => 'books#show', as: "book"

  # 編集画面
  get 'books/:id/edit' => 'books#edit', as: "edit_book"
  patch 'books/:id' => 'books#update', as: 'update_book'
  # 削除
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end

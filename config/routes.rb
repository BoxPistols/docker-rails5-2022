Rails.application.routes.draw do
  root 'books#index'

  # TOP画面
  get 'top' => 'books#top'

  # POST画面
  get 'new' => 'books#new'
  post 'books' => 'books#create'

  # 詳細画面
  get 'books/:id' => 'books#show', as: "book"

  # 編集画面
  get 'books/:id/edit' => 'books#edit', as: "edit_book"

end

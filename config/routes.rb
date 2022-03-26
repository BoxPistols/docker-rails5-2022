Rails.application.routes.draw do
  root 'books#index'

  # TOP画面
  get 'top' => 'books#top'

  # POST画面
  get 'new' => 'books#new'
  post 'books' => 'books#create'

  # 詳細画面
  get 'books/show'
  # 編集画面
  get 'books/edit'

end

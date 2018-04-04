Rails.application.routes.draw do
  get 'questions/index'

  get 'questions/new'

  get 'questions/show'

  get 'questions/edit'

  get 'questions/update'

  get 'questions/destroy'

  get 'questions/create'

  resources :posts

  get 'about' => 'welcome#about'

  root 'welcome#index'
end

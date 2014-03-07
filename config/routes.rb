RootsOfSuccess::Application.routes.draw do

  devise_for :users
  devise_scope :user do
    root 'devise/sessions#new'
  end

  get "teacher_dashboard/index", as: :teacher_dashboard_index

  get 'admin_dashboard/index', to: 'admin_dashboard#index'
  get '/new_teacher', to: 'admin_dashboard#new_teacher', as: 'new_teacher'
  post '/new_teacher', to: 'admin_dashboard#create_teacher', as: 'create_teacher'

  resources :learning_modules
end

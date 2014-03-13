RootsOfSuccess::Application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users

  get "teacher_dashboard/index", as: :teacher_dashboard_index

  get 'admin_dashboard/index', to: 'admin_dashboard#index'
  get '/new_teacher', to: 'admin_dashboard#new_teacher', as: 'new_teacher'
  post '/new_teacher', to: 'admin_dashboard#create_teacher', as: 'create_teacher'

  get 'teacher_dashboard/index', to: 'teacher_dashboard#index'
  get '/new_student', to: 'teacher_dashboard#new_student', as: 'new_student'
  post '/new_student', to: 'teacher_dashboard#create_student', as: 'create_student'

  resources :learning_modules
  resources :classrooms
  resources :students
end

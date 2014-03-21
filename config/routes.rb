RootsOfSuccess::Application.routes.draw do
  get "profile/show"
  get "profile/edit"
  get "profile/update"
  root to: 'static_pages#home'

  devise_for :users

  scope '/teacher_dashboard' do
    get 'index', to: 'teacher_dashboard#index', as: :teacher_dashboard
    get '/new_student', to: 'teacher_dashboard#new_student', as: :new_student
    post '/new_student', to: 'teacher_dashboard#create_student', as: :create_student
  end

  scope '/admin_dashboard' do
    get 'index', to: 'admin_dashboard#index', as: :admin_dashboard
    get '/new_teacher', to: 'admin_dashboard#new_teacher', as: :new_teacher
    get '/show_teachers', to: 'admin_dashboard#show_teachers', as: :show_teachers
    post '/new_teacher', to: 'admin_dashboard#create_teacher', as: :create_teacher
  end

  resources :profiles, only: [:show, :edit, :update]

  resources :learning_modules
  resources :classrooms
  resources :students
end

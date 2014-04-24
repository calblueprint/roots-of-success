RootsOfSuccess::Application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go
  # to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change
  # the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being
  # the default of "forem"
  mount Forem::Engine, at: '/forums'      

  devise_scope :user do
    get '/logout' => 'devise/sessions#destroy'
    root to: 'devise/sessions#new'
  end
  devise_for :users, controllers: { registrations: 'students/registrations' }

  scope '/teacher_dashboard' do
    get 'index',         to: 'teacher_dashboard#index', as: :teacher_dashboard
    get '/new_student',  to: 'teacher_dashboard#new_student', as: :new_student
    post '/new_student', to: 'teacher_dashboard#create_student',
                         as: :create_student
  end

  scope '/admin_dashboard' do
    get 'index',          to: 'admin_dashboard#index', as: :admin_dashboard
    get '/new_teacher',   to: 'admin_dashboard#new_teacher', as: :new_teacher
    get '/show_teachers', to: 'admin_dashboard#show_teachers',
                          as: :show_teachers
    get '/show_students', to: 'admin_dashboard#show_students',
                          as: :show_students
    get '/surveys',       to: 'admin_dashboard#surveys',
                          as: :surveys
    post '/new_teacher',  to: 'admin_dashboard#create_teacher',
                          as: :create_teacher
  end

  resources :profiles, only: [:show, :edit, :update]

  resources :learning_modules

  resources :classrooms
  scope '/classrooms' do
    get '/:id/add_students', to: 'classrooms#add_students_form',
                             as: :add_students_form
    post '/:id/add_students', to: 'classrooms#add_students_to_classroom',
                              as: :add_students
  end

  resources :students
end

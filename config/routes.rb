Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      # Future API routes here
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :teacher do
    root to: "devise/sessions#new"
  end
  devise_for :teachers

  namespace :teachers, as: :teacher do
    resource :dashboard, only: :show, controller: "dashboard"
  end

  resources :students, only: [] do
    member do
      get :confirm
    end

    get "/surveys/:survey_id", to: "students#show_survey", as: :show_survey
    post "/surveys/:survey_id/confirm", to: "students#confirm_survey", as: :confirm_survey

    get "/quizzes/:quiz_id", to: "students#show_quiz", as: :show_quiz
  end

  scope module: :teachers do
    resources :changelog_items, only: [:index]

    resources :teachers, only: [:edit, :update] do
      resources :classrooms, shallow: true do
        member { post :transfer }

        scope module: :classrooms do
          resources :supplemental_materials, only: [:index, :new, :create, :edit, :update] do
            collection do
              get :manage
              post :change_position
            end
          end

          resources :students, except: [:show] do
            member { post :resend_confirmation }
          end

          resources :learning_modules, only: :index
          get "/learning_modules/:id",
              to: "learning_modules#show",
              as: :learning_module
          post "/learning_modules/:id/toggle_present",
               to: "learning_modules#toggle_present",
               as: :learning_module_toggle_present

          resources :surveys, only: [:index]
          # Unfortunately we can't undo a shallow: true so we need to be verbose here.
          post "/surveys/:survey_id/administer",
               to: "surveys#administer",
               as: :survey_administer

          resources :quizzes, only: [:index]
          post "/quizzes/:quiz_id/administer",
               to: "quizzes#administer",
               as: :quizzes_administer
          get "/quizzes/:quiz_id/manage_students", # ???
              to: "quizzes#manage_students",
              as: :quizzes_manage_students
        end
      end
    end
  end
end

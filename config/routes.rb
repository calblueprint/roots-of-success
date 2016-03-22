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
  end

  scope module: :teachers do
    resources :changelog_items, only: [:index]

    resources :teachers, only: [:edit, :update] do
      resources :classrooms, shallow: true do
        member { post :transfer }

        # TODO(sam): Move rest of controllers into this namespace
        scope module: :classrooms do
          resources :supplemental_materials, only: [:index]
          resources :students, except: [:show] do
            member { post :resend_confirmation }
          end
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
      end

      # namespace :classrooms do
      # end
    end
  end
end

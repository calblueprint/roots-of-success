Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      # Future API routes here
    end
  end

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
      get :survey
      post :confirm_survey
    end
  end

  scope module: :teachers do
    resources :teachers, only: [:edit, :update] do
      resources :classrooms, shallow: true do
        resources :students, only: [:new, :create, :index, :destroy] do # Other actions to come
          member { post :resend_confirmation }
        end

        resources :learning_modules, only: :index
        get "/learning_modules/:id",
            to: "learning_modules#show", as: :learning_module
        post "/learning_modules/:id/toggle_present",
             to: "learning_modules#toggle_present", as: :learning_module_toggle_present

        resources :surveys, only: :index
        post "/surveys/:id/administer",
             to: "surveys#administer", as: :survey_administer
      end
    end
  end
end

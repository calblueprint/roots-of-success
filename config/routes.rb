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
    member { get :confirm }
  end

  scope module: :teachers do
    resources :teachers, only: [:edit, :update] do
      resources :classrooms, shallow: true do
        resources :students, only: [:new, :create, :index, :destroy] do # Other actions to come
          member { post :resend_confirmation }
        end

        resources :learning_modules, only: :index
        get "/learning_modules/:id",
            to: "learning_modules#show", as: "learning_module"
        post "/learning_modules/:id/present",
             to: "learning_modules#present", as: :learning_module_present
      end
    end
  end
end

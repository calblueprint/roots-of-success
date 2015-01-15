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

  scope module: :teachers do
    resources :teachers, only: [:edit, :update] do
      resources :classrooms, shallow: true do
        resources :students, shallow: true do
          member { get :confirm }
        end
      end
    end
  end
end

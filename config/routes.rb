Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      scope module: :teachers do
        resources :teachers, only: [:edit, :update]
      end
    end
  end

  devise_scope :teacher do
    root to: "devise/sessions#new"
  end
  devise_for :teachers, controllers: { sessions: "teachers/sessions" }

  namespace :teachers, as: :teacher do
    resource :dashboard, only: [:show], controller: "dashboard"
  end
end

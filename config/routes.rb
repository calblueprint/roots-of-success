Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      scope module: :teachers do
        resources :teachers, only: [:edit, :update] do
          collection { get :current }
          resources :classrooms, only: [:index, :show, :create, :update, :destroy]
        end
      end
    end
  end

  devise_scope :teacher do
    root to: "devise/sessions#new"
  end
  devise_for :teachers

  namespace :teachers, as: :teacher do
    resource :dashboard, only: [:show], controller: "dashboard"
  end
end

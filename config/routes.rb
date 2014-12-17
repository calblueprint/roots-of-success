Rails.application.routes.draw do
  devise_scope :teacher do
    root to: "devise/sessions#new"
  end
  devise_for :teachers

  namespace :teachers, as: :teacher do
    resource :dashboard, only: [:show], controller: "dashboard"
  end
end

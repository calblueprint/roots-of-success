Rails.application.routes.draw do
  devise_scope :teacher do
    root to: "devise/sessions#new"
  end
  devise_for :teachers
end

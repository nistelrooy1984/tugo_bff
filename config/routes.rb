Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :campaigns do
    namespace :v1 do
      resources :campaigns, only: %i[index]
    end
  end

  namespace :common do
    namespace :v1 do
      resources :employees, only: %i[index]
    end
  end

  namespace :contacts do
    namespace :v1 do
      resources :contacts, only: %i[index create]
    end
  end

  namespace :leads do
    namespace :v1 do
      resources :leads, only: %i[index create show]
    end
  end

  namespace :organizations do
    namespace :v1 do
      resources :organizations, only: %i[index]
    end
  end
end

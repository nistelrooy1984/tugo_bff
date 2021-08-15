# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :campaigns do
    namespace :v1 do
      resources :campaigns, only: %i[index]
    end
  end

  namespace :common do
    namespace :v1 do
      resources :roles, only: %i[index show create]
      resources :departments, only: %i[index]
      resources :users, only: %i[index create] do
        collection do
          get :login
          get :user_name
          get :user_id
          get :subordinate_users
        end
      end
      resources :master, only: %i[] do
        collection do
          get :countries_provinces_districts
        end
      end
      resources :master, only: %i[] do
        collection do
          get :wards
        end
      end
    end
  end

  namespace :contacts do
    namespace :v1 do
      resources :contacts, only: %i[index create] do
        collection do
          get :assigned_to
        end
      end
    end
  end

  namespace :leads do
    namespace :v1 do
      resources :leads, only: %i[index create show] do
        collection do
          get :assigned_to
          post :upsert
        end
      end
    end
  end

  namespace :organizations do
    namespace :v1 do
      resources :organizations, only: %i[index]
    end
  end
end

Rails.application.routes.draw do
  # /api/v1/stars で index を返す
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :stars, only: [:index]
      resources :nicknames, only: %i[index show], param: :name

      namespace :gss do
        resources :characters, only: %i[index show], param: :name
      end
    end
  end
end

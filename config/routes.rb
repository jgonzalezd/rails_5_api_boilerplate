Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users
    end
  end

  scope module: :api, defaults: {format: :json} do
    scope module: :v1, path: '/api/v1' do
      get '/hello', to: 'authorized#hello'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

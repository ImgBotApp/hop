Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :websites, only: [:index, :create, :edit, :update] do
    member do
      get "template" => "websites#template"
    end
  end

  get '/:url' => 'websites#redirect'

  mount Attachinary::Engine => "/attachinary"

end

Rails.application.routes.draw do



  constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
    resources :companies

    resources :campuses do
      resources :rooms do
        resources :events
      end
    end
  end

  get 'company' => 'companies#show'

  constraints Clearance::Constraints::SignedIn.new do

    delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
    resources :users
    resources :invites
    resources :comments
    resources :amenities

    resources :campuses do
      resources :rooms, only: [:show, :index] do
        resources :events
      end
    end

    get 'campuses/:campus_id/events' => 'campuses#events'

    post 'invite_codes' => "invite_codes#create"
    root 'dashboard#home'

    resources :passwords, controller: "clearance/passwords", only: [:create, :new]
    resource :session, controller: "clearance/sessions", only: [:create]

    resources :users, controller: "clearance/users", only: [:create] do
      resource :password,
        controller: "clearance/passwords",
        only: [:create, :edit, :update]
    end
  end

  constraints Clearance::Constraints::SignedOut.new do
    resources :passwords, controller: "clearance/passwords", only: [:create, :new]
    resource :session, controller: "clearance/sessions", only: [:create]

    resources :users, only: [:new, :create]

    resources :users, controller: "clearance/users", except: [:create] do
      resource :password,
        controller: "clearance/passwords",
        only: [:create, :edit, :update]
    end

    get "/sign_in" => "clearance/sessions#new", as: "sign_in"
    get "/sign_up" => "clearance/users#new", as: "sign_up"

    root "clearance/sessions#new", as: :guest_root
  end

end

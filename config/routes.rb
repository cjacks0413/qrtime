Qrtime::Application.routes.draw do



  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}


  resources :student_activities do
    member do
      get :confirmation_in
      get :confirmation_out
    end
    collection do
      post :check_in
      post :check_out
    end

  end


  resources :requests do
    get 'read'
  end


  resources :course_sessions do
    get 'check_in'
    get 'check_out'
  end


  resources :courses do
  member do
    get :roll
  end
  end


  devise_for :users
  resources :users do
    member do
      get :courses
      post :course_add
      post :course_remove
    end

  end

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"


end
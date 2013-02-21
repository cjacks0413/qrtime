Qrtime::Application.routes.draw do



  resources :student_activities, :except => [:create, :new] do
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
  end


  resources :courses


  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users
  resources :users
end
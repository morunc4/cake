Rails.application.routes.draw do
 
  root to: 'public/homes#top'
  get 'about'=>'public/homes#about'
  scope module: :public do
    resources :customers,only:[:show,:edit]
  end
  
  
  namespace :admin do
    resources :genrse,only:[:index,:create,:edit,:update]
    resources :items,only:[:index,:new,:create,:show,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:index,:show]
  end
  devise_for :customers,skip:[:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin,skip:[:registrations,:passwords],controllers: {
    sessions: "admin/sessions"
    
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

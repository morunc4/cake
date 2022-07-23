Rails.application.routes.draw do
  
  devise_for :customers,skip:[:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin,skip:[:registrations,:passwords],controllers: {
    sessions: "admin/sessions"
    
  }
  
  root to: 'public/homes#top'
  get 'about'=>'public/homes#about'
  scope module: :public do
    resources :customers,only:[:show,:edit]
    resources :addresses,only:[:index,:edit,:create,:destroy]
    resources :items,only:[:index,:show,]
    resources :cart_items,only:[:index,:update,:destroy,:create] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders,only:[:new,:index,:show]
    #delete :cart_items,to: 'cart_items#destroy_all',as: 'destroy_all'
  end
  
  
  namespace :admin do
    resources :genrse,only:[:index,:create,:edit,:update]
    resources :items,only:[:index,:new,:create,:show,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:index,:show]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

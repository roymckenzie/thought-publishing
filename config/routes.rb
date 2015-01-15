Rails.application.routes.draw do
  root 'home#show'

  devise_for :users, :skip => [:registrations]                                          
  #   as :user do
  #     get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
  #     put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
  #   end

  resources :thoughts do
    member do
      patch :unpublish
      patch :publish
    end
  end
  
end
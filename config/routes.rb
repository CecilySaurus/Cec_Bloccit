Bloccit::Application.routes.draw do

  devise_for :users

  resources :posts, :questions, :advertisements

  get 'welcome/contact'
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end



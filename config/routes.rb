Bloccit::Application.routes.draw do

  devise_for :users

  resources :questions, :advertisements

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'welcome/contact'
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end



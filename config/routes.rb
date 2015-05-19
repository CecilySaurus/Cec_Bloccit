Bloccit::Application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  get 'advertisements/index'
=======
>>>>>>> 3a7bcf7c58c27b99c83ecb36b0cd2137c227d9c2

  resources :posts, :questions, :advertisements

<<<<<<< HEAD
    resources :posts, :advertisements, :questions
=======
  get 'welcome/contact'
>>>>>>> 3a7bcf7c58c27b99c83ecb36b0cd2137c227d9c2

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end


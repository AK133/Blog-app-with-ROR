Rails.application.routes.draw do
    get '/about', to: 'about#index'
  get '/contact', to: 'contact#index'
  devise_for :users
  get '/my_posts', to: 'blog_posts#my_posts'


  resources :blog_posts do
    resources :likes, only: [:create, :destroy]
  end

  root "blog_posts#index"
end


  # get '/blog_posts/my_posts', to: 'blog_posts#my_posts'
  # get "/blog_posts/new", to: "blog_posts#new"
  # get "/blog_posts/:id/edit", to: "blog_posts#edit"
  # patch "/blog_posts/:id", to: "blog_posts#update"
  # delete "/blog_posts/:id", to: "blog_posts#destroy"
  # get "/blog_posts/:id", to: "blog_posts#show"
  # post "/blog_posts", to: "blog_posts#create"
  


Rails.application.routes.draw do
  devise_for :users
  root 'posts#index' #ルートアクセス
    # get 'posts' => 'posts#index' #一覧表示
    # get 'posts/new' => 'posts#new' #投稿画面
    # post 'posts' => 'posts#create' #投稿
    # delete 'posts/:id' => 'posts#destroy' #削除
    # patch 'posts/:id' => 'posts#update' #編集したやつを更新
    # get 'posts/:id/edit' => 'posts#edit' #編集

    resources :posts

  end

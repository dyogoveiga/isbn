Rails.application.routes.draw do
  resource :search, only: :show

  root to: 'searchs#show'
end

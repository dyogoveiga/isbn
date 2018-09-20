Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root to: 'homes#show'
  namespace 'isbn' do
    resource :validator, only: :create
  end
end

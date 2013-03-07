RailsSample::Application.routes.draw do

  resources :documents, :except => :show do
    collection do
      get 'search'
      get 'auto_complete'
      get 'bulk_index'
    end
  end

  get 'about', :to => 'home#about'
  root :to => 'home#index'

end

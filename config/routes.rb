Rails.application.routes.draw do



  resources :pedido_items
  resources :pedidos
  resources :receipts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :entrega_items
  resources :entregas do
    member do
      # /entregas/:id/pdf
      get 'pdf'
    end
    # collection do
    #    get :update_produtos
    # end

  end
  resources :produtos
  resources :materials
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'app#index'
  # match ':controller(/:action(/:id))', :via => [:get, :post]
  resources :clientes
  resources :despesas do
    collection do
      get :gerar_saida
    end
  end
  resources :recebimentos do
    collection do
      get :gerar_entrada
    end
  end

  resources :fin_movimentos do
    collection do
       post :faturamento
        get :fluxo_caixa,:realizar_movimento, :graficos, :verificar_saldo
    end
  end

  resources :app do
    collection do
      get :dashboard, :cotacao,:entregas_detalhes, :cotacao_padrao, :cotacao_fundo_tampa
    end
  end

end

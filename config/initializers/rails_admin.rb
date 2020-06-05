# adicionando pdf
require './lib/rails_admin/entrega_pdf.rb'
 RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::Pdf)


RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
   # config.authenticate_with do
   #   warden.authenticate! scope: :user
   # end
   # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.main_app_name = ["CARTOKRAFT - ","Administrativo" ]

  # config.navigation_static_links = {
  #   'Novo Pedido' => '/receives/new',
  #   'Nova Despesa' => '/expenses/new'
  #
  # }

  # config.navigation_static_label = "Lins Úteis"


  config.actions do
    # dashboard do
    #   statistics false
    # end
    dashboard
    index                         # mandatory
    new

    # print_entrega
    # export
    #bulk_delete
    show
    edit
    delete
    pdf do
      only Entrega
    end
    #show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

    config.model Cliente do
        navigation_icon 'fa fa-id-card'
        navigation_label 'Cadastros'
    end

    config.model Material do
        navigation_icon 'fa fa-id-card'
        navigation_label 'Cadastros'
    end

    config.model Produto do
        navigation_icon 'fa fa-id-card'
        navigation_label 'Cadastros'
    end

    config.model Entrega do
        navigation_icon 'fa fa-id-card'
        navigation_label 'Produção'
        # field :dt_entrega do
          # strftime_format "%d/%m/%Y"
        # end
    end



     config.model User do
       navigation_icon 'fa fa-user'
       navigation_label 'Cadastros'
     end

     config.excluded_models << ClienteProduto




end

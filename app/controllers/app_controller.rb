class AppController < ApplicationController
      # before_action :authenticate_user!


      def dashboard
          # verificar saldo atual
          # conn = ActiveRecord::Base.connection
          # result = conn.execute "SELECT saldo_atual_cc() as saldo, proximas_saidas(30) as saidas,
          #                               proximas_entradas(30) as entradas"
          #
          # result.each do |ret|
          #    @saldoCC     =  ret[0]
          #    @PrxSaidas   =  ret[1]
          #    @PrxEntradas =  ret[2]
          #
          # end
          #
          # @saldos = FechamentoCaixa.order('periodo DESC')

          if !params[:dt_analise].blank?
            dt_analise = Date.parse params[:dt_analise]
          else
            dt_analise = Date.today
          end

          # today = Date.today #- 1.months

          # Entregas
          @dt_anterior_ini = (dt_analise - 1.months).at_beginning_of_month
          @dt_anterior_fim = (dt_analise - 1.months).at_end_of_month

          @dt_atual_ini = dt_analise.at_beginning_of_month
          @dt_atual_fim = dt_analise.at_end_of_month

          @entregasMesAnterior = Entrega.where(["status IN (1,2,3,4) and dt_faturamento >=? and dt_faturamento <=?", @dt_anterior_ini,@dt_anterior_fim]).sum("vl_total")
          @entregasMesAtual = Entrega.where(["status IN (1,2,3,4) and dt_faturamento >=? and dt_faturamento <=?", @dt_atual_ini,@dt_atual_fim]).sum("vl_total")
          @entregasPendentes = Entrega.where("status = 2").sum("vl_total")
          @ProducaoMesAtual = Entrega.where(["status <> 5 and dt_faturamento >=? and dt_faturamento <=?", @dt_atual_ini,@dt_atual_fim]).order(:dt_entrega)



          render :dashboard
          #render(:partial => "saldoCC", :locals => {:saldoCC => @saldoCC})
      end

      def cotacao_padrao

      end


      def cotacao_padrao

      end

      def entregas_detalhes

          if !params[:dt_analise].blank?
            dt_analise = Date.parse params[:dt_analise]
          else
            dt_analise = Date.today
          end

          # today = Date.today #- 1.months

          # Entregas
          @dt_anterior_ini = (dt_analise - 1.months).at_beginning_of_month
          @dt_anterior_fim = (dt_analise - 1.months).at_end_of_month

          @dt_atual_ini = dt_analise.at_beginning_of_month
          @dt_atual_fim = dt_analise.at_end_of_month

          @entregasMesAnterior = Entrega.where(["status IN (1,2,3,4) and dt_faturamento >=? and dt_faturamento <=?", @dt_anterior_ini,@dt_anterior_fim]).sum("vl_total")
          @entregasMesAtual = Entrega.where(["status IN (1,2,3,4) and dt_faturamento >=? and dt_faturamento <=?", @dt_atual_ini,@dt_atual_fim]).sum("vl_total")
          @entregasPendentes = Entrega.where("status = 2").sum("vl_total")
          @ProducaoMesAtual = Entrega.where(["status <> 5 and dt_faturamento >=? and dt_faturamento <=?", @dt_atual_ini,@dt_atual_fim]).order(:dt_entrega)



          render :entregas_detalhes
          #render(:partial => "saldoCC", :locals => {:saldoCC => @saldoCC})
      end

      def index
        @dt_analise = Date.today
        if !params[:dt_analise].blank?
          dt_analise = Date.parse params[:dt_analise]
          @dt_analise = dt_analise
        else
          dt_analise = Date.today
        end


        @dt_atual_ini = dt_analise.at_beginning_of_month
        @dt_atual_fim = dt_analise.at_end_of_month

         @entregasMesAnterior = Entrega.where(["status IN (1,2,3,4) and dt_faturamento >=? and dt_faturamento <=?", @dt_anterior_ini,@dt_anterior_fim]).sum("vl_total")
        # @entregasMesAtual = Entrega.where(["status IN (1,2,3,4) and dt_faturamento >=? and dt_faturamento <=?", @dt_atual_ini,@dt_atual_fim]).sum("vl_total")
        # @entregasPendentes = Entrega.where("status = 2").sum("vl_total")
        # @ProducaoMesAtual = Entrega.where(["status <> 5 and dt_faturamento >=? and dt_faturamento <=?", @dt_atual_ini,@dt_atual_fim]).order(:dt_entrega)

        @pedidos_abertos = Pedido.where(" status LIKE '%Pedido%' and (dt_fechamento is null or (dt_fechamento >=? and dt_fechamento <=?""))", @dt_atual_ini,@dt_atual_fim)
        @vl_pedidos_abertos = Pedido.where(" status LIKE '%Pedido%' and (dt_fechamento is null or (dt_fechamento >=? and dt_fechamento <=?""))", @dt_atual_ini,@dt_atual_fim).sum("vl_total_pedido")
        # and dt_faturamento >=? and dt_faturamento <=?", @dt_atual_ini,@dt_atual_fim]
        @pedidos_producao = Pedido.where(" status LIKE '%Produção%' and (dt_fechamento is null or (dt_fechamento >=? and dt_fechamento <=?""))", @dt_atual_ini,@dt_atual_fim)
        @vl_pedidos_producao = Pedido.where(" status LIKE '%Produção%' and (dt_fechamento is null or (dt_fechamento >=? and dt_fechamento <=?""))", @dt_atual_ini,@dt_atual_fim).sum("vl_total_pedido")

        @pedidos_produzidos = Pedido.where(" (status ='Produzido' or status = 'Entregue') and (dt_fechamento is null or (dt_fechamento >=? and dt_fechamento <=?""))", @dt_atual_ini,@dt_atual_fim)
        @vl_pedidos_produzidos = Pedido.where(" (status ='Produzido' or status = 'Entregue') and (dt_fechamento is null or (dt_fechamento >=? and dt_fechamento <=?""))", @dt_atual_ini,@dt_atual_fim).sum("vl_total_venda")

        @vl_total_pedidos = @vl_pedidos_abertos +  @vl_pedidos_producao + @vl_pedidos_produzidos

      end


end

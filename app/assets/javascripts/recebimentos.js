function gerar_receita(){
 //confirm("Msg Helow 2!!!!");

 var conta = $('#fin_conta').val();

 var nr_parcelas = $('#nr_parcela').val();
 var vl_parcelas = $('#vl_parcela').val();
 var dt_inicio = $('#dt_inicio').val();
 var receita_id = $('#receita_id').val();
 var recorrencia = $('#recorrencia').val();
   $.get("gerar_entrada",{ conta: conta,
         nr_parcelas: nr_parcelas,vl_parcelas: vl_parcelas, dt_inicio: dt_inicio, receita_id: receita_id,
                      recorrencia: recorrencia });
   console.log("Enviou ao controller");
 }

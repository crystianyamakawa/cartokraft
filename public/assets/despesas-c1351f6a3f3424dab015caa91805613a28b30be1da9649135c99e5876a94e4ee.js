function gerar_despesas(){var a=$("#fin_conta").val(),e=$("#nr_parcela").val(),r=$("#vl_parcela").val(),l=$("#dt_inicio").val(),c=$("#despesa_id").val(),i=$("#recorrencia").val();$.get("gerar_saida",{conta:a,nr_parcelas:e,vl_parcelas:r,dt_inicio:l,despesa_id:c,recorrencia:i}),console.log("Enviou ao controller")}
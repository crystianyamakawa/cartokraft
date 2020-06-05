// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function cotacao_padrao(){
 //confirm("Calculo Cotação!!!!");

 var v_comprimento = $('#comprimento').val();

 var v_largura = Number($('#largura').val());
 var v_altura = Number($('#altura').val());
 var v_vl_custo = Number($('#vl_custo').val());
 var v_margem = Number($('#margem').val());

 var v_comprimento_chapa = ((2*v_largura)+(2*v_comprimento)+5)/100;
 var v_largura_chapa = (v_largura + v_altura)/100;
 var v_area_chapa = (v_comprimento_chapa * v_largura_chapa);
 var v_custo_chapa = Number(v_area_chapa * v_vl_custo).toFixed(2);
 console.log('v_custo_chapa: ' + v_custo_chapa);
 console.log('v_margem: ' + v_margem);

 var v_venda = (v_custo_chapa * (1+(v_margem/100)));

 document.getElementById("lb_comprimento").innerHTML = v_comprimento_chapa;
 document.getElementById("lb_largura").innerHTML = v_largura_chapa;
 document.getElementById("lb_area").innerHTML = v_area_chapa;
 document.getElementById("lb_custo").innerHTML = v_custo_chapa;
 document.getElementById("lb_preco").innerHTML = v_venda.toFixed(2);


 }

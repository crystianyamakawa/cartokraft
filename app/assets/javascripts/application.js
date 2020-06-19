//= require jquery
//= require turbolinks
//= require chartkick
//= require jquery_ujs
//= require bootstrap
//= require_tree .
//= require Chart.bundle


function currency_to_number(inField, outField ){
  var currency = $(inField).val();
  var outf = $(outField).attr('id');
  currency = currency.replace(/[^0-9\,]+/g,"");
  currency = currency.replace(',',".");
  document.getElementById(outf).value = currency;
}



function remove_fields( link) {
  //$(link).prevAll("input[type=hidden]").first().val("1");
  //$(link).closest(".fields_remove").hide();
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function(){
   $(".totalvenda").keyup(function(){

     var qt_venda = $("#edit_qt_pedido").val();
     var qt_produzido = $("#edit_qt_produzido").val();
     var vl_venda = $("#edit_vl_venda").val().replace(',',".");
     var vl_custo = $("#edit_vl_custo").val().replace(',',".");
     $("#edit_vl_venda").val(vl_venda);
     $("#edit_vl_custo").val(vl_custo);

     $("#edit_vl_total_pedido").val(Number(parseFloat(qt_venda) * parseFloat(vl_venda)).toFixed(2));
     $("#edit_vl_total_venda").val(Number(parseFloat(qt_produzido) * parseFloat(vl_venda)).toFixed(2));

   });

   $(".totalfaturamento").keyup(function(){
     //alert("Entrou");
     var vl_venda  = $("#edit_vl_venda").val().replace(',',".");
     var vl_custo   = $("#edit_vl_custo").val().replace(',',".");
     //var vl_bruto   = $("#edit_vl_bruto").val().replace(',',".");
     var vl_despesa   = $("#edit_vl_despesa").val().replace(',',".");
     // var vl_liquido = $("#edit_vl_despesa").val().replace(',',".");
     $("#edit_vl_venda").val(vl_venda);
     $("#edit_vl_custo").val(vl_custo);
     $("#edit_vl_despesa").val(vl_despesa);

     $("#edit_vl_bruto").val(Number(parseFloat(vl_venda) - parseFloat(vl_custo)).toFixed(2));
     $("#edit_vl_liquido").val(Number(parseFloat($("#edit_vl_bruto").val()) - parseFloat(vl_despesa)).toFixed(2));

   });






 });

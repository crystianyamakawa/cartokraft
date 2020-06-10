//= require jquery
//= require turbolinks
//= require chartkick
//= require jquery_ujs
//= require bootstrap
//= require_tree .




function currency_to_number(inField, outField ){
  var currency = $(inField).val();
  var outf = $(outField).attr('id');
  currency = currency.replace(/[^0-9\,]+/g,"");
  currency = currency.replace(',',".");
  document.getElementById(outf).value = currency;
}

function func_test(){
   alert("Entrou no JavaScript");
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

$(document).ready ->
   alert("Entrou no JavaScript")

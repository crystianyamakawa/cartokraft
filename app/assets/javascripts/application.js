//= require jquery
//= require turbolinks
//= require chartkick
//= require jquery_ujs
//= require bootstrap
// require  jquery.dataTables
//= require_tree .


// materialize-sprockets


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

$(document).on 'rails_admin.dom_ready', ->
  // alert("Entrou no JavaScript")
